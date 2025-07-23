# hyprmcp

## Dependencies

### [grim-hyprland](https://github.com/eriedaberrie/grim-hyprland)
A specialized screenshot utility forked from the original grim project, specifically designed to work with the Hyprland window manager. It leverages Hyprland's custom protocols to capture specific windows using window addresses, while maintaining compatibility with standard screenshot methods for entire outputs or selected regions.
Already in C/C++, convertable to Zig. now in 2025 translate-c-to-zig project is complete.

### [wztype](https://github.com/conneroisu/wztype)
A Zig implementation of wtype, a tool for simulating keyboard input on Wayland. Provides Unicode character typing, modifier and named key support, configurable keystroke delays, and stdin text input processing. Uses Wayland's virtual keyboard protocol with dynamic XKB keymap generation for comprehensive unicode support.
Already in Zig.

### [cpp-sdk](https://github.com/modelcontextprotocol/cpp-sdk)
The official Cpp implementation of the Model Context Protocol (MCP). Provides a core package for the protocol implementation and procedural macros for generating tool implementations. Enables building both clients and servers using async Rust with flexible transport mechanisms and streamlined networked service development.

### [HYPRLAND](https://github.com/hyprwm/hyprland)
A dynamic tiling Wayland compositor. It is provided as c/c++ code, but can be converted to Zig.
