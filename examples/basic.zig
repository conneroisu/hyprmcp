const std = @import("std");
const hyprmcp = @import("hyprmcp");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();
    
    std.log.info("HyprMCP Basic Example", .{});
    std.log.info("Version: {s}", .{hyprmcp.version});
    std.log.info("Protocol Version: {s}", .{hyprmcp.protocol_version});
    
    // Initialize HyprMCP with default configuration
    var server = hyprmcp.init(allocator) catch |err| switch (err) {
        error.HyprlandNotRunning => {
            std.log.warn("Hyprland is not running or not accessible", .{});
            std.log.info("This example requires a running Hyprland session", .{});
            return;
        },
        else => return err,
    };
    defer server.deinit();
    
    std.log.info("HyprMCP server initialized successfully", .{});
    std.log.info("In a real application, you would call server.run() here", .{});
}