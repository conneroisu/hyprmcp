# Introduction

HyprMCP is a sophisticated bridge between AI-powered desktop automation and the modern Wayland compositor ecosystem. Built with Zig for exceptional performance and memory safety, HyprMCP enables AI assistants to interact intelligently with Hyprland-based desktop environments through the Model Context Protocol (MCP).

## What is HyprMCP?

HyprMCP provides a standardized, secure, and semantically rich interface that allows AI systems to understand, query, and control desktop state with the same level of sophistication they bring to text processing. It addresses the growing need for AI systems to move beyond text-only interactions and engage with the graphical desktop environment where users spend most of their productive time.

## Key Features

- **Model Context Protocol Compliance**: Full implementation of MCP v2025-06-18 specification
- **High Performance**: Built with Zig for zero-cost abstractions and optimal runtime performance  
- **Memory Safety**: Compile-time safety guarantees prevent common memory and threading bugs
- **Comprehensive Desktop Control**: Window management, workspace control, and text input automation
- **Security-First Design**: Multi-layered security with input validation, rate limiting, and audit logging
- **Extensible Architecture**: Modular design enables easy addition of new automation capabilities

## Architecture Overview

HyprMCP follows a modular architecture with distinct layers:

- **Protocol Layer**: Implements MCP request/response patterns with error handling and capability negotiation
- **Integration Layer**: Provides domain-specific functionality through well-defined interfaces  
- **Transport Layer**: Supports multiple communication mechanisms (stdio, HTTP, Server-Sent Events)
- **Security Layer**: Comprehensive security controls including sandboxing and access management

## Use Cases

- **AI Desktop Automation**: Enable AI assistants to perform complex desktop workflows
- **Development Workflows**: Automate code editing, testing, and deployment processes
- **Content Creation**: Streamline multimedia and document creation workflows
- **System Administration**: Automated system monitoring and maintenance tasks
- **Accessibility**: Enhanced desktop interaction for users with diverse abilities

## Getting Started

Ready to get started? Check out our [Getting Started Guide](./getting-started.md) for installation instructions and basic usage examples.

## Getting Help

If you encounter any issues or have questions:

- Check the [API Reference](./api-reference.md) for detailed information
- Review the [Configuration](./configuration.md) guide
- Visit the [GitHub repository](https://github.com/conneroisu/hyprmcp) for issues and discussions
- Read the [Contributing Guide](./contributing.md) to help improve the project