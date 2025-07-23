# Installation

This guide covers different ways to install HyprMCP on your system.

## System Requirements

Before installing HyprMCP, ensure your system meets these requirements:

- **Operating System**: Linux with Wayland support (kernel 5.4+)
- **Desktop Compositor**: Hyprland v0.35+ with IPC protocol v2 support
- **Runtime Environment**: Active Wayland session with proper XDG environment variables
- **System Libraries**:
  - `libxkbcommon-dev` - Advanced keyboard layout and input method support
  - `wayland-dev` - Core Wayland protocol implementation with client libraries
  - `wayland-protocols` - Extended Wayland protocol specifications for virtual input devices

## From Source (Recommended)

### Using Zig

HyprMCP is now built with Zig for optimal performance and memory safety:

```bash
# Clone the repository
git clone https://github.com/conneroisu/hyprmcp.git
cd hyprmcp

# Build the project
zig build

# Install to system path (optional)
zig build --prefix ~/.local install

# Or run directly
zig build run -- server
```

### Using Nix (Recommended for Development)

If you're using Nix, you can build and install HyprMCP using the provided flake:

```bash
# Enter development environment
nix develop

# Build the package
nix build

# Install to your profile
nix profile install .

# Or run directly from the flake
nix run . -- server
```

### Development Setup

For development and contribution:

```bash
# Clone and enter development environment
git clone https://github.com/conneroisu/hyprmcp.git
cd hyprmcp
nix develop  # or ensure Zig 0.13+ is installed

# Run tests
zig build test

# Format code
zig build fmt

# Build examples
zig build examples

# Generate documentation
zig build docs
```

## Pre-built Binaries

Pre-built binaries will be available for download from the [GitHub releases page](https://github.com/conneroisu/hyprmcp/releases) once the first release is published.

Supported architectures:
- x86_64-linux
- aarch64-linux

## Package Managers

### Arch Linux (AUR)

```bash
# Using yay or another AUR helper
yay -S hyprmcp-git

# Or manually
git clone https://aur.archlinux.org/hyprmcp-git.git
cd hyprmcp-git
makepkg -si
```

### NixOS

Add to your `configuration.nix`:

```nix
{
  environment.systemPackages = with pkgs; [
    hyprmcp
  ];
}
```

### Homebrew (macOS - Not Supported)

HyprMCP requires Hyprland and Wayland, which are Linux-specific technologies. macOS support is not planned.

## Verification

After installation, verify that HyprMCP is working correctly:

```bash
# Check version
hyprmcp version

# Get help
hyprmcp help

# Test server startup (requires Hyprland session)
hyprmcp server
```

## Environment Setup

HyprMCP requires these environment variables to be set (usually automatic in Hyprland sessions):

```bash
# Required for Hyprland IPC
export HYPRLAND_INSTANCE_SIGNATURE="your-signature"

# Required for Wayland
export WAYLAND_DISPLAY="wayland-1"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
```

## Troubleshooting

### Common Issues

**"Hyprland not running or not accessible"**
- Ensure you're running HyprMCP within a Hyprland session
- Check that `HYPRLAND_INSTANCE_SIGNATURE` environment variable is set
- Verify Hyprland IPC socket exists: `ls /tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/`

**"Failed to connect to Wayland display"**
- Ensure `WAYLAND_DISPLAY` is set correctly
- Check that Wayland compositor is running
- Verify XDG runtime directory permissions

**"Permission denied accessing input devices"**
- Add your user to the `input` group: `sudo usermod -a -G input $USER`
- Log out and back in for group changes to take effect

### Build Issues

**"Zig compiler not found"**
- Install Zig 0.13.0 or later from [ziglang.org](https://ziglang.org/download/)
- Or use the Nix development environment

**"Missing system dependencies"**
- Install required libraries: `sudo apt install libxkbcommon-dev wayland-dev wayland-protocols`
- Or equivalent for your distribution

## Next Steps

Once installed, proceed to [Configuration](./configuration.md) to set up HyprMCP for your environment, then check out [Getting Started](./getting-started.md) for basic usage examples.