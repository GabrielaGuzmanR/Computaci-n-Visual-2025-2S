## Taller 1 - Transformaciones Básicas en Computación Visual

This project implements basic geometric transformations (translation, rotation, and scaling) in various visual programming environments as part of the Taller 1 assignment. The goal was to create a "Visual Hello World" by applying static and animated transformations to a simple object or scene, with animations driven by time. The environments used are Python (Matplotlib), Unity (optional), Three.js with React Three Fiber, and Processing.

The repository is structured as follows:

```bash
2025-04-15_taller1_transformaciones/
├── python/
├── unity/
├── threejs/
├── processing/
└── README.md
```

# Implementations
# 1. Python (Matplotlib, NumPy, Imageio)
Description: A 2D scene was created using Matplotlib to display a geometric shape (a square defined by points). Transformations (translation, rotation, and scaling) were applied using transformation matrices with NumPy. An animation was generated to show the shape translating along the X-axis, rotating around its center, and scaling cyclically over time. The animation was exported as a GIF using Imageio.

Transformations Applied:
Translation: Moves the shape horizontally by a fixed amount per frame.
Rotation: Rotates the shape by an angle proportional to the frame number.
Scaling: Scales the shape using a sinusoidal function for smooth oscillation.
Tools: Matplotlib for rendering, NumPy for matrix operations, Imageio for GIF export.
Output: A GIF showing the animated transformations.

Code: See python/transformations.py for the implementation.

# 2. Unity (Optional)
Description: A 3D Unity project was created with a cube in an empty scene. A C# script was attached to the cube to apply:

Random translation along the X or Y axis every few seconds using transform.Translate().
Constant rotation around the Y-axis using transform.Rotate() with Time.deltaTime for frame-rate independence.
Oscillating scaling using transform.localScale and Mathf.Sin(Time.time) for smooth variation.
Transformations Applied:
Translation: Random jumps in X or Y every 2 seconds.
Rotation: Continuous rotation at a constant speed.
Scaling: Sinusoidal scaling for a pulsating effect.
Tools: Unity LTS, C# scripting.
Output: A playable scene with a transforming cube.

Code: See unity/Assets/Scripts/CubeTransform.cs for the script.

# 3. Three.js with React Three Fiber
Description: A 3D scene was built using React Three Fiber in a Vite project. A cube was added and animated using the useFrame hook to apply:

Sinusoidal translation along a circular or wave-like trajectory.
Rotation around its own axis with an incremental angle per frame.
Smooth scaling using Math.sin(clock.elapsedTime) for a cyclic effect.
Bonus: OrbitControls were added for interactive camera navigation.
Transformations Applied:
Translation: Circular motion in the XZ plane.
Rotation: Continuous rotation around the Y-axis.
Scaling: Sinusoidal scaling for a breathing effect.
Tools: Vite, React Three Fiber, Three.js.
Output: A web-based interactive 3D scene.

Code: See threejs/src/components/Cube.jsx for the main component.


# 4. Processing (2D or 3D)
Description: A 3D Processing sketch was created to display a box. Transformations were applied using translate(), rotate(), and scale() within pushMatrix() and popMatrix() to isolate effects. The box moves in a wave-like pattern, rotates continuously, and scales cyclically based on sin(frameCount).

Transformations Applied:
Translation: Wave-like motion using sin(millis()).
Rotation: Continuous rotation around two axes.
Scaling: Cyclic scaling for a pulsing effect.
Tools: Processing (P3D mode).
Output: A real-time 3D animation.

Code: See processing/transformations.pde for the sketch.

Repository Structure

```bash
python/: Contains the Python script and exported GIF.
unity/: Contains the Unity project (optional) and C# script.
threejs/: Contains the React Three Fiber project and build output.
processing/: Contains the Processing sketch and exported media.
README.md: This file with documentation.
```
