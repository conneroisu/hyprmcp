# Contributing to HyprMCP

Thank you for your interest in contributing to HyprMCP! This document provides guidelines and information for contributors.

## Table of Contents

- [Getting Started](#getting-started)
- [Development Setup](#development-setup)
- [Code Style](#code-style)
- [Testing](#testing)
- [Submitting Changes](#submitting-changes)
- [Security](#security)

## Getting Started

HyprMCP is a Zig-based Model Context Protocol server that enables AI assistants to interact with Hyprland desktop environments. Before contributing, please:

1. Read the [README.md](README.md) for project overview
2. Review the [technical specifications](specs/v1.md)
3. Check existing [issues](https://github.com/conneroisu/hyprmcp/issues) and [pull requests](https://github.com/conneroisu/hyprmcp/pulls)

## Development Setup

### Prerequisites

- Zig 0.13.0 or later
- Linux with Wayland support
- Hyprland v0.35+ (for testing)
- Git

### Quick Start

```bash
# Clone the repository
git clone https://github.com/conneroisu/hyprmcp.git
cd hyprmcp

# Build the project
zig build

# Run tests
zig build test

# Format code
zig build fmt

# Build examples
zig build examples

# Generate documentation
zig build docs
```

### With Nix (Recommended)

```bash
# Enter the development shell
nix develop

# Or with direnv
direnv allow
```

## Code Style

We follow standard Zig conventions with some project-specific guidelines:

### Formatting

- Use `zig fmt` to format all code before committing
- Run `zig build fmt` to format the entire project
- 4-space indentation
- 100-character line limit where reasonable

### Naming Conventions

- **Functions**: `camelCase` (e.g., `getWindows`, `typeText`)
- **Types**: `PascalCase` (e.g., `HyprlandClient`, `WindowInfo`)
- **Constants**: `UPPER_SNAKE_CASE` (e.g., `MAX_WINDOWS`, `DEFAULT_DELAY`)
- **Variables**: `snake_case` (e.g., `window_list`, `client_id`)

### Documentation

- All public functions and types must have documentation comments
- Use `///` for documentation comments
- Include usage examples for complex functions
- Document error conditions and return values

Example:
```zig
/// Focus a window by address, class, or title
/// 
/// This function attempts to focus the specified window using Hyprland's
/// IPC protocol. It supports multiple targeting methods with fallback.
/// 
/// ## Parameters
/// - `allocator`: Memory allocator for temporary operations
/// - `client`: Connected Hyprland client
/// - `params`: Window targeting parameters
/// 
/// ## Returns
/// Returns a FocusResult containing operation status and metadata.
/// 
/// ## Errors
/// - `error.HyprlandConnectionFailed`: Cannot communicate with Hyprland
/// - `error.InvalidWindow`: Specified window does not exist
/// - `error.ValidationError`: Invalid parameters provided
/// 
/// ## Example
/// ```zig
/// const result = try hyprFocusWindow(allocator, client, .{
///     .class = "firefox",
/// });
/// ```
pub fn hyprFocusWindow(
    allocator: std.mem.Allocator,
    client: *HyprlandClient,
    params: FocusParameters,
) !FocusResult {
    // Implementation...
}
```

## Testing

### Unit Tests

- Write tests for all public functions
- Place tests in the same file as the code being tested
- Use descriptive test names that explain what is being tested

```zig
test "hyprFocusWindow with valid window class" {
    const testing = std.testing;
    const allocator = testing.allocator;
    
    // Test implementation...
    try testing.expect(result.success);
}
```

### Integration Tests

- Integration tests go in the `tests/` directory
- Test real Hyprland interactions when possible
- Mock external dependencies appropriately

### Running Tests

```bash
# Run all tests
zig build test

# Run tests in specific file
zig test src/hyprland/client.zig

# Run tests with verbose output
zig build test -- --verbose
```

## Submitting Changes

### Before Submitting

1. **Code Quality**:
   - Run `zig build fmt` to format code
   - Run `zig build test` to ensure all tests pass
   - Run `zig build` to verify compilation
   - Check for memory leaks with test allocator

2. **Documentation**:
   - Update documentation for new features
   - Add docstrings to public functions
   - Update specs if making architectural changes

3. **Git Practices**:
   - Create feature branches from `main`
   - Use clear, descriptive commit messages
   - Squash commits when appropriate

### Commit Message Format

Use conventional commits format:

```
type(scope): description

[optional body]

[optional footer]
```

Types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

Examples:
```
feat(tools): add hypr_get_workspaces tool

Implement workspace enumeration tool with comprehensive metadata
including workspace ID, name, active status, and window count.

Closes #123
```

### Pull Request Process

1. **Create Pull Request**:
   - Use a clear, descriptive title
   - Fill out the PR template completely
   - Reference related issues

2. **Code Review**:
   - Address all review comments
   - Maintain discussion thread until resolved
   - Update PR description if scope changes

3. **Merging**:
   - Ensure CI passes
   - Obtain required approvals
   - Maintainer will merge when ready

## Security

### Security-First Development

HyprMCP handles desktop automation, which requires careful security considerations:

1. **Input Validation**:
   - Validate all user inputs and MCP parameters
   - Sanitize commands before execution
   - Implement rate limiting

2. **Permission Checks**:
   - Respect desktop security boundaries
   - Implement capability-based access control
   - Audit security-sensitive operations

3. **Safe Defaults**:
   - Use allowlists instead of blocklists
   - Minimize default permissions
   - Fail securely when errors occur

### Reporting Security Issues

**DO NOT** create public issues for security vulnerabilities.

Instead:
1. Email security issues to: [security email - to be added]
2. Use GitHub's private vulnerability reporting
3. Include detailed reproduction steps
4. Allow reasonable time for response

## Architecture Guidelines

### Module Organization

```
src/
├── main.zig           # CLI entry point
├── root.zig           # Library root module
├── server/            # MCP server implementation
├── hyprland/          # Hyprland IPC integration
├── input/             # Text input and keyboard automation
├── tools/             # MCP tool implementations
├── config/            # Configuration management
├── security/          # Security and validation
└── tests/             # Integration tests
```

### Error Handling

- Use Zig's explicit error handling
- Provide meaningful error messages
- Include context for debugging
- Document all possible errors

### Memory Management

- Use provided allocators consistently
- Clean up resources in `deinit()` functions
- Test for memory leaks
- Avoid global state when possible

### Async Programming

- Use Zig's async/await for I/O operations
- Handle cancellation appropriately
- Avoid blocking operations in async contexts

## Getting Help

- **Documentation**: Check [docs/](docs/) and [specs/](specs/)
- **Discussions**: Use GitHub Discussions for questions
- **Issues**: Create issues for bugs and feature requests
- **Chat**: [Community chat - to be added]

## Recognition

Contributors are recognized in:
- GitHub contributors list
- Release notes for significant contributions
- Documentation credits

Thank you for contributing to HyprMCP!