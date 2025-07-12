{
  description = "HyprMCP Documentation";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        
        # Build the mdBook documentation
        docs = pkgs.stdenv.mkDerivation {
          name = "hyprmcp-docs";
          src = ./.;
          
          nativeBuildInputs = with pkgs; [
            mdbook
          ];
          
          buildPhase = ''
            mdbook build
          '';
          
          installPhase = ''
            mkdir -p $out
            cp -r book/* $out/
          '';
        };
        
        # Development shell with mdBook and preview server
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            mdbook
          ];
          
          shellHook = ''
            echo "HyprMCP Documentation Development Environment"
            echo "Commands available:"
            echo "  mdbook build   - Build the documentation"
            echo "  mdbook serve   - Serve with live reload (http://localhost:3000)"
            echo "  mdbook test    - Test code samples in documentation"
            echo "  mdbook clean   - Clean build artifacts"
          '';
        };
        
      in
      {
        packages = {
          default = docs;
          docs = docs;
        };
        
        devShells.default = devShell;
        
        # Apps for easy running
        apps = {
          build = flake-utils.lib.mkApp {
            drv = pkgs.writeShellScriptBin "build-docs" ''
              ${pkgs.mdbook}/bin/mdbook build
            '';
          };
          
          serve = flake-utils.lib.mkApp {
            drv = pkgs.writeShellScriptBin "serve-docs" ''
              ${pkgs.mdbook}/bin/mdbook serve --open
            '';
          };
          
          deploy = flake-utils.lib.mkApp {
            drv = pkgs.writeShellScriptBin "deploy-docs" ''
              echo "Building documentation..."
              ${pkgs.mdbook}/bin/mdbook build
              echo "Documentation built in ./book/"
              echo "Deploy the contents of ./book/ to your web server"
            '';
          };
        };
      });
}