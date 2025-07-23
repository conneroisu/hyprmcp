const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // Library module
    const lib = b.addModule("hyprmcp", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });

    // Main executable
    const exe = b.addExecutable(.{
        .name = "hyprmcp",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            .optimize = optimize,
        }),
    });

    exe.root_module.addImport("hyprmcp", lib);

    // System dependencies (will be added when implementing)
    // exe.linkLibC();
    // exe.linkSystemLibrary("wayland-client");
    // exe.linkSystemLibrary("xkbcommon");

    b.installArtifact(exe);

    // Run command
    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run HyprMCP server");
    run_step.dependOn(&run_cmd.step);

    // Tests
    const lib_unit_tests = b.addTest(.{
        .root_module = lib,
    });

    const run_lib_unit_tests = b.addRunArtifact(lib_unit_tests);

    const exe_unit_tests = b.addTest(.{
        .root_module = exe.root_module,
    });

    const run_exe_unit_tests = b.addRunArtifact(exe_unit_tests);

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_lib_unit_tests.step);
    test_step.dependOn(&run_exe_unit_tests.step);

    // Examples
    const examples_step = b.step("examples", "Build examples");
    
    // Basic usage example
    const basic_example = b.addExecutable(.{
        .name = "basic_example",
        .root_module = b.createModule(.{
            .root_source_file = b.path("examples/basic.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "hyprmcp", .module = lib },
            },
        }),
    });
    examples_step.dependOn(&b.addInstallArtifact(basic_example, .{}).step);

    // Development tools
    const fmt_step = b.step("fmt", "Format source code");
    const fmt_cmd = b.addFmt(.{
        .paths = &.{
            "src",
            "examples",
            "tests",
            "build.zig",
        },
    });
    fmt_step.dependOn(&fmt_cmd.step);

    // Documentation
    _ = b.step("docs", "Generate documentation (manual: zig build-lib src/root.zig -femit-docs)");
}