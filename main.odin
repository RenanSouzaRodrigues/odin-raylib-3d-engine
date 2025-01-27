package main

import rl "vendor:raylib"

main :: proc() {
    rl.SetTraceLogLevel(.ERROR);
    rl.SetConfigFlags({ .MSAA_4X_HINT, .VSYNC_HINT });

    rl.InitWindow(1920, 1080, "Test Game");
    defer rl.CloseWindow();

    // GAME TICK
    for !rl.WindowShouldClose() {
        rl.BeginDrawing();
        rl.ClearBackground(rl.WHITE);
        rl.EndDrawing();
    }
}