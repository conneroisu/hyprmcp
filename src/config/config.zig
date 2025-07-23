const std = @import("std");

pub const Config = struct {
    server: ServerSettings,
    security: SecuritySettings,
    input: InputSettings,
    hyprland: HyprlandSettings,
    
    const Self = @This();
    
    pub fn load(allocator: std.mem.Allocator) !Self {
        _ = allocator;
        // TODO: Implement config file loading
        return Self.default();
    }
    
    pub fn default() Self {
        return Self{
            .server = ServerSettings{
                .bind_address = "127.0.0.1:8080",
                .log_level = .info,
                .max_concurrent_connections = 10,
            },
            .security = SecuritySettings{
                .allowed_commands = &[_][]const u8{ "firefox", "kitty", "code" },
                .rate_limit_per_minute = 300,
                .session_timeout_minutes = 60,
                .audit_logging = true,
            },
            .input = InputSettings{
                .default_keystroke_delay_ms = 12,
                .max_text_length = 10000,
                .unicode_normalization = true,
            },
            .hyprland = HyprlandSettings{
                .socket_timeout_ms = 5000,
                .retry_attempts = 3,
                .event_monitoring = true,
            },
        };
    }
};

pub const ServerSettings = struct {
    bind_address: []const u8,
    log_level: std.log.Level,
    max_concurrent_connections: u32,
};

pub const SecuritySettings = struct {
    allowed_commands: []const []const u8,
    rate_limit_per_minute: u32,
    session_timeout_minutes: u32,
    audit_logging: bool,
};

pub const InputSettings = struct {
    default_keystroke_delay_ms: u32,
    max_text_length: usize,
    unicode_normalization: bool,
};

pub const HyprlandSettings = struct {
    socket_timeout_ms: u32,
    retry_attempts: u32,
    event_monitoring: bool,
};