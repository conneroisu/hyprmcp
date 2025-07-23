const std = @import("std");
const log = std.log;
const print = std.debug.print;

const Server = @import("server/server.zig").Server;
const Config = @import("config/config.zig").Config;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();
    
    // Parse command line arguments
    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);
    
    if (args.len < 2) {
        try printUsage();
        return;
    }
    
    const command = args[1];
    
    if (std.mem.eql(u8, command, "server")) {
        try runServer(allocator);
    } else if (std.mem.eql(u8, command, "version")) {
        try printVersion();
    } else if (std.mem.eql(u8, command, "help")) {
        try printUsage();
    } else {
        print("Unknown command: {s}\n", .{command});
        try printUsage();
        std.process.exit(1);
    }
}

fn runServer(allocator: std.mem.Allocator) !void {
    log.info("Starting HyprMCP server...", .{});
    
    // Load configuration
    const config = Config.load(allocator) catch |err| switch (err) {
        error.FileNotFound => {
            log.info("Using default configuration", .{});
            Config.default();
        },
        else => return err,
    };
    
    // Initialize and start server
    var server = try Server.init(allocator, config);
    defer server.deinit();
    
    log.info("HyprMCP server started successfully", .{});
    try server.run();
}

fn printVersion() !void {
    print("HyprMCP v1.0.0\n", .{});
    print("Model Context Protocol server for Hyprland desktop automation\n", .{});
}

fn printUsage() !void {
    print("HyprMCP - Hyprland Model Context Protocol Server\n\n", .{});
    print("USAGE:\n", .{});
    print("    hyprmcp <COMMAND>\n\n", .{});
    print("COMMANDS:\n", .{});
    print("    server     Start the MCP server\n", .{});
    print("    version    Print version information\n", .{});
    print("    help       Print this help message\n\n", .{});
    print("For more information, visit: https://github.com/conneroisu/hyprmcp\n", .{});
}

test "main functionality" {
    // Basic test to ensure main module compiles
    const testing = std.testing;
    try testing.expect(true);
}