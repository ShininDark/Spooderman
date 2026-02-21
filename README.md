# 🕸️ Spiderman Project

A physics-based movement game built in Godot. This project focuses on mechanics using ray-casting and vector mathematics.
**The game concept is from a similar game i used to play in my childhood. Building this project all on my own by researching some solutions in various parts.**

## 🚀 Current Features

* ### **Dynamic Physics-Based Swinging**
    Custom swing logic that redirects linear velocity into tangential momentum, preventing "jitter" and ensuring smooth circular arcs through vector projection.

* ### **Raycast Attachment**
    **Precision grappling** using collision masks, the rope attaches only to specific "Building" layers while allowing the player to pass through them seamlessly.

* ### **Velocity Management**
    Implemented **speed clamping** and **Auto-Boost mechanics** to maintain game flow and prevent physics breaking at high speeds.


## 🏗️ Project Status: Currently on Hold

> ### **Current Focus: Learning & Research Phase (Procedural Generation)**

This project is currently being used as a way for me to learn Procedural Generation. Instead of static level design, the goal is to implement an infinite chunk-based system.

I am currently studying and implementing:

1.  **Scene Instancing:** Learning to spawn level segments (chunks) dynamically at runtime based on player position.
2.  **Memory Management:** Effectively **"purging" or queue-freeing** off-screen chunks to optimize performance and prevent memory leaks.
3.  **Algorithmic Variety:** Utilizing **randomization algorithms** to ensure building placement remains challenging, fair, and engaging for an endless loop.

**The repository will be updated once the procedural generator is fully integrated with the existing physics engine.**
