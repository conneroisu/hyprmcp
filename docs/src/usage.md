# Usage

This guide covers how to use HyprMCP in practice.

## Starting the Server

To start the HyprMCP server:

```bash
# Start with default configuration
hyprmcp serve

# Start with custom port
hyprmcp serve --port 3001

# Start with debug logging
hyprmcp serve --log-level debug
```

The server will start and listen for MCP connections on the configured port.

## MCP Integration

HyprMCP implements the Model Context Protocol, allowing AI assistants and other tools to interact with your Hyprland desktop.

### Connecting an MCP Client

Most MCP clients can connect to HyprMCP using the server's address:

```json
{
  "mcpServers": {
    "hyprmcp": {
      "command": "hyprmcp",
      "args": ["serve"]
    }
  }
}
```

### Available Tools

HyprMCP provides various tools for desktop interaction:

- **Window Management**: Focus, move, resize, close windows
- **Workspace Control**: Switch workspaces, move windows between workspaces
- **Information Queries**: Get window information, workspace status
- **Configuration**: Read and modify Hyprland configuration

## Examples

### Basic Window Operations

```bash
# Focus a specific window
hyprmcp focus-window --class "firefox"

# Move window to workspace
hyprmcp move-window --window-id 12345 --workspace 3

# Close active window
hyprmcp close-window
```

### Workspace Management

```bash
# Switch to workspace 2
hyprmcp switch-workspace --workspace 2

# Get current workspace info
hyprmcp get-workspace
```

### Information Queries

```bash
# List all windows
hyprmcp list-windows

# Get window information
hyprmcp window-info --window-id 12345

# Get current Hyprland configuration
hyprmcp get-config
```

## Troubleshooting

### Common Issues

1. **Connection Failed**: Ensure Hyprland is running and the socket paths are correct
2. **Permission Denied**: Check that your user has access to Hyprland sockets
3. **Command Not Found**: Verify HyprMCP is properly installed and in your PATH

### Debug Mode

Run with debug logging to troubleshoot issues:

```bash
hyprmcp serve --log-level debug
```

### Socket Issues

If socket auto-detection fails, manually specify paths:

```bash
hyprmcp serve --socket-path /path/to/hyprland.sock
```

## Advanced Usage

For advanced use cases, refer to the [API Reference](./api-reference.md) for detailed information about all available commands and their parameters.