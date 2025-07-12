# API Reference

This section provides detailed documentation for all HyprMCP tools and resources available through the MCP protocol.

## Tools

HyprMCP provides the following tools that can be called by MCP clients:

### Window Management

#### `hypr_focus_window`
Focus a specific window.

**Parameters:**
- `window_id` (optional): Window ID to focus
- `class` (optional): Window class name to focus
- `title` (optional): Window title pattern to match

**Returns:** Success status

#### `hypr_close_window`
Close a window.

**Parameters:**
- `window_id` (optional): Window ID to close (defaults to active window)

**Returns:** Success status

#### `hypr_move_window`
Move a window to a different position or workspace.

**Parameters:**
- `window_id`: Window ID to move
- `workspace` (optional): Target workspace number
- `x` (optional): X coordinate
- `y` (optional): Y coordinate

**Returns:** Success status

### Workspace Management

#### `hypr_switch_workspace`
Switch to a different workspace.

**Parameters:**
- `workspace`: Workspace number or name

**Returns:** Success status

#### `hypr_get_workspace`
Get information about the current workspace.

**Returns:** Workspace information object

### Information Queries

#### `hypr_list_windows`
List all windows on the desktop.

**Returns:** Array of window objects with details

#### `hypr_window_info`
Get detailed information about a specific window.

**Parameters:**
- `window_id`: Window ID to query

**Returns:** Window information object

#### `hypr_get_config`
Get current Hyprland configuration.

**Returns:** Configuration object

## Resources

HyprMCP provides access to the following resources:

### Windows Resource
- **URI Pattern**: `hypr://windows/{id}`
- **Description**: Individual window information
- **Content Type**: `application/json`

### Workspaces Resource
- **URI Pattern**: `hypr://workspaces/{id}`
- **Description**: Workspace information and window list
- **Content Type**: `application/json`

### Config Resource
- **URI Pattern**: `hypr://config`
- **Description**: Current Hyprland configuration
- **Content Type**: `text/plain`

## Data Types

### Window Object
```json
{
  "id": 12345,
  "class": "firefox",
  "title": "Mozilla Firefox",
  "workspace": 1,
  "position": {
    "x": 100,
    "y": 50
  },
  "size": {
    "width": 1200,
    "height": 800
  },
  "focused": true
}
```

### Workspace Object
```json
{
  "id": 1,
  "name": "workspace_1",
  "active": true,
  "windows": [12345, 67890]
}
```

## Error Handling

All tools return standardized error responses when operations fail:

```json
{
  "error": "WINDOW_NOT_FOUND",
  "message": "Window with ID 12345 not found",
  "details": {
    "window_id": 12345
  }
}
```

### Common Error Codes

- `WINDOW_NOT_FOUND`: Specified window does not exist
- `WORKSPACE_NOT_FOUND`: Specified workspace does not exist
- `HYPRLAND_CONNECTION_ERROR`: Cannot connect to Hyprland
- `INVALID_PARAMETER`: Invalid parameter value provided
- `PERMISSION_DENIED`: Insufficient permissions for operation

## Rate Limiting

To prevent overwhelming Hyprland, HyprMCP implements rate limiting:

- Maximum 100 requests per minute per client
- Burst allowance of 20 requests
- Information queries are lighter weight than control operations