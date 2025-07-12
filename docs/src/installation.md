# Installation

This guide covers different ways to install HyprMCP on your system.

## From Source (Recommended)

### Using Cargo

```bash
# Clone the repository
git clone https://github.com/conneroisu/hyprmcp.git
cd hyprmcp

# Build and install
cargo install --path .
```

### Using Nix

If you're using Nix, you can build and install HyprMCP using the provided flake:

```bash
# Build the package
nix build

# Install to your profile
nix profile install .
```

## Pre-built Binaries

Pre-built binaries will be available for download from the [GitHub releases page](https://github.com/conneroisu/hyprmcp/releases) once the first release is published.

## System Requirements

- **Operating System**: Linux (Hyprland is Linux-only)
- **Hyprland**: Version 0.35.0 or later
- **Rust**: 1.70.0 or later (if building from source)

## Verification

After installation, verify that HyprMCP is working correctly:

```bash
# Check version
hyprmcp --version

# Test basic functionality
hyprmcp --help
```

## Next Steps

Once installed, proceed to [Configuration](./configuration.md) to set up HyprMCP for your environment.