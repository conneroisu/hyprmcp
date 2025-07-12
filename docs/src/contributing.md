# Contributing

We welcome contributions to HyprMCP! This guide will help you get started.

## Development Setup

1. **Fork and clone the repository**:
   ```bash
   git clone https://github.com/your-username/hyprmcp.git
   cd hyprmcp
   ```

2. **Set up the development environment**:
   ```bash
   # Using Nix (recommended)
   nix develop

   # Or manually install Rust
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   ```

3. **Build and test**:
   ```bash
   cargo build
   cargo test
   ```

## Project Structure

```
hyprmcp/
├── src/              # Main source code
├── docs/             # Documentation (this book)
├── tests/            # Integration tests
├── examples/         # Example usage
├── Cargo.toml        # Rust package configuration
├── flake.nix         # Nix development environment
└── README.md         # Project overview
```

## Coding Standards

### Rust Code Style

- Follow standard Rust formatting: `cargo fmt`
- Ensure clippy passes: `cargo clippy`
- Add tests for new functionality
- Document public APIs with rustdoc comments

### Commit Messages

Use conventional commit format:

```
type(scope): description

[optional body]

[optional footer]
```

Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

Examples:
- `feat(api): add window resize tool`
- `fix(server): handle connection timeout properly`
- `docs(guide): update installation instructions`

## Contributing Process

1. **Create an issue** (for new features or bugs)
2. **Create a feature branch**: `git checkout -b feature/your-feature`
3. **Make your changes** with tests and documentation
4. **Test thoroughly**:
   ```bash
   cargo test
   cargo clippy
   cargo fmt --check
   ```
5. **Submit a pull request** with:
   - Clear description of changes
   - Reference to related issue
   - Updated documentation if needed

## Testing

### Unit Tests
```bash
cargo test
```

### Integration Tests
```bash
cargo test --test integration
```

### Documentation Tests
```bash
cargo test --doc
```

## Documentation

### Code Documentation
- Use rustdoc comments for public APIs
- Include examples in documentation
- Keep docs up to date with code changes

### User Documentation
- Update relevant sections in `docs/src/`
- Build and preview: `mdbook serve docs/`
- Follow the existing style and structure

## Areas for Contribution

We especially welcome contributions in these areas:

- **New MCP Tools**: Additional Hyprland operations
- **Performance**: Optimizations and benchmarks
- **Documentation**: Examples, guides, API improvements
- **Testing**: More comprehensive test coverage
- **Error Handling**: Better error messages and recovery
- **Configuration**: More flexible configuration options

## Getting Help

- **Questions**: Open a discussion on GitHub
- **Bugs**: Create an issue with reproduction steps
- **Features**: Open an issue to discuss before implementing
- **Chat**: Join our community discussions

## Code of Conduct

Please note that this project is released with a Contributor Code of Conduct. By participating in this project you agree to abide by its terms.

## License

By contributing to HyprMCP, you agree that your contributions will be licensed under the same license as the project.