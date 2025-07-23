# hyprmcp

## Dependencies

### [grim-hyprland](https://github.com/eriedaberrie/grim-hyprland)
A specialized screenshot utility forked from the original grim project, specifically designed to work with the Hyprland window manager. It leverages Hyprland's custom protocols to capture specific windows using window addresses, while maintaining compatibility with standard screenshot methods for entire outputs or selected regions.
Already in C/C++, convertable to Zig.

### [wztype](https://github.com/conneroisu/wztype)
A Zig implementation of wtype, a tool for simulating keyboard input on Wayland. Provides Unicode character typing, modifier and named key support, configurable keystroke delays, and stdin text input processing. Uses Wayland's virtual keyboard protocol with dynamic XKB keymap generation for comprehensive unicode support.
Already in Zig.

### [hyprland-rs](https://github.com/hyprland-community/hyprland-rs)
An unofficial Rust wrapper for Hyprland's Inter-Process Communication (IPC), providing comprehensive modules for retrieving compositor data, event listening, dispatching commands, managing configuration keywords, and calling Hyprctl commands. Simplifies integration of Hyprland functionality into Rust projects.
In Rust, need to generate bindings for C/C++ code, then convert to Zig?

### [rust-sdk](https://github.com/modelcontextprotocol/rust-sdk)
The official Rust implementation of the Model Context Protocol (MCP), designed to work with the tokio async runtime. Provides a core crate for the RMCP protocol implementation and procedural macros for generating tool implementations. Enables building both clients and servers using async Rust with flexible transport mechanisms and streamlined networked service development.
In Rust, need to generate bindings for C/C++ code, then convert to Zig?
