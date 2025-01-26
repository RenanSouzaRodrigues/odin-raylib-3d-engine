package main

import "core:fmt"
import alg "core:math/linalg"
import rl "vendor:raylib"

draw_engime_root_gizmos :: proc () {
    rl.DrawLine(0, 0, 10, 0, rl.RED);
    rl.DrawLine(0, 0, 0, 10, rl.GREEN);
    rl.DrawLine3D({0, 0, 0}, {0, 0, 10}, rl.BLUE)
}


main :: proc() {
    rl.SetTraceLogLevel(.ERROR);
    rl.SetConfigFlags({ .MSAA_4X_HINT });

    rl.InitWindow(1920, 1080, "Monk Engine");
    defer rl.CloseWindow();

    camera : rl.Camera3D = {
        position = {50, 50, 50},
        target = {0, 0, 0},
        up = {0, 1, 0},
        fovy = 60,
        projection = .PERSPECTIVE
    };

    // rl.SetTargetFPS(200)
    for !rl.WindowShouldClose() {
        rl.BeginDrawing();
        defer rl.EndDrawing();

        rl.UpdateCamera(&camera, .ORBITAL);

        rl.ClearBackground({ 128, 180, 255 ,255 });

        rl.BeginMode3D(camera);
        draw_engime_root_gizmos();


        rl.DrawCube({0, 20 ,0}, 10 ,10 ,10, {255, 240, 240, 255});
        rl.DrawGrid(10, 10);
        
        rl.EndMode3D();

        rl.DrawFPS(10, 10);
    }
}