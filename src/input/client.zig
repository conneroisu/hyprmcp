const std = @import("std");

pub const InputClient = struct {
    allocator: std.mem.Allocator,
    
    const Self = @This();
    
    pub fn init(allocator: std.mem.Allocator) !Self {
        return Self{
            .allocator = allocator,
        };
    }
    
    pub fn deinit(self: *Self) void {
        _ = self;
        // TODO: Cleanup input client
    }
};