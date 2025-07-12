# Configuration

HyprMCP can be configured through various methods to suit your needs.

## Configuration File

HyprMCP looks for configuration files in the following locations (in order of priority):

1. `$XDG_CONFIG_HOME/hyprmcp/config.toml`
2. `~/.config/hyprmcp/config.toml`
3. `./hyprmcp.toml` (current directory)

### Example Configuration

```toml
[server]
# Port to bind the MCP server to
port = 3000
# Host to bind to
host = "127.0.0.1"

[hyprland]
# Socket path for Hyprland IPC (auto-detected if not specified)
socket_path = "/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket.sock"
# Event socket path (auto-detected if not specified)
event_socket_path = "/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

[logging]
# Log level: trace, debug, info, warn, error
level = "info"
# Log format: pretty, json
format = "pretty"
```

## Environment Variables

You can also configure HyprMCP using environment variables:

- `HYPRMCP_PORT`: Server port
- `HYPRMCP_HOST`: Server host
- `HYPRMCP_LOG_LEVEL`: Logging level
- `HYPRLAND_SOCKET`: Hyprland IPC socket path

Environment variables take precedence over configuration file values.

## Command Line Options

Most configuration options can also be specified via command line arguments:

```bash
hyprmcp serve --port 3000 --host 0.0.0.0 --log-level debug
```

Use `hyprmcp serve --help` for a complete list of available options.

## Auto-detection

HyprMCP automatically detects Hyprland socket paths using the `$HYPRLAND_INSTANCE_SIGNATURE` environment variable when running under Hyprland. Manual configuration is only needed in special cases.

## Next Steps

With configuration complete, learn how to use HyprMCP in the [Usage](./usage.md) guide.