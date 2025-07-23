//! HyprMCP - Hyprland Model Context Protocol Server
//! 
//! This is the root module for the HyprMCP library, which provides
//! AI assistants with desktop automation capabilities for Hyprland
//! through the Model Context Protocol (MCP).

const std = @import("std");

// Re-export core modules for library users
pub const Server = @import("server/server.zig").Server;
pub const Config = @import("config/config.zig").Config;
pub const HyprlandClient = @import("hyprland/client.zig").HyprlandClient;
pub const InputClient = @import("input/client.zig").InputClient;

// Re-export tool modules
pub const WindowTools = @import("tools/window.zig");
pub const InputTools = @import("tools/input.zig");
pub const WorkspaceTools = @import("tools/workspace.zig");

// Re-export security modules
pub const Security = @import("security/security.zig");

// Library version information
pub const version = "1.0.0";
pub const protocol_version = "2025-06-18";

/// Initialize the HyprMCP library with default configuration
pub fn init(allocator: std.mem.Allocator) !Server {
    const config = Config.default();
    return Server.init(allocator, config);
}

/// Initialize the HyprMCP library with custom configuration
pub fn initWithConfig(allocator: std.mem.Allocator, config: Config) !Server {
    return Server.init(allocator, config);
}

test "library initialization" {
    const testing = std.testing;
    const allocator = testing.allocator;
    
    // Test default initialization
    var server = init(allocator) catch |err| switch (err) {
        // Accept connection failures in test environment
        error.HyprlandNotRunning => return,
        else => return err,
    };
    defer server.deinit();
    
    try testing.expect(true);
}

test "version information" {
    const testing = std.testing;
    try testing.expect(std.mem.eql(u8, version, "1.0.0"));
    try testing.expect(std.mem.eql(u8, protocol_version, "2025-06-18"));
}