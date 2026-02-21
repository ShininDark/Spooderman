# 🕸️ Grapple-Swing Endless Runner (Working Title)

A **physics-based 2D movement prototype** built in **Godot 4.x**. This project focuses on high-momentum swinging mechanics using **ray-casting** and **vector mathematics** to simulate a satisfying and responsive "swing" feel.

---

## 🚀 Current Features

* ### **Dynamic Physics-Based Swinging**
    Custom swing logic that **redirects linear velocity into tangential momentum**, preventing "jitter" and ensuring smooth circular arcs through vector projection.

* ### **Raycast Attachment**
    **Precision grappling** using collision masks—the rope attaches only to specific "Building" layers while allowing the player to pass through them seamlessly.

* ### **State-Based Animation**
    Integrated `AnimationPlayer` logic that **dynamically swaps** between swinging, falling, and idle states based on real-time player physics and rope status.

* ### **Velocity Management**
    Implemented **speed clamping** and **"Auto-Boost" mechanics** to maintain game flow and prevent physics breaking at high speeds.

* ### **Global Score Management**
    A **singleton-based (Global) `ScoreManager`** script is already implemented and ready to track player progression across the infinite environment.

---

## 🏗️ Project Status: Currently on Hold

> ### **Current Focus: Learning & Research Phase (Procedural Generation)**

This project is currently being used as a primary **case study for Procedural Level Generation**. Instead of static level design, the goal is to implement an **infinite chunk-based system**. 

I am currently studying and implementing:

1.  **Scene Instancing:** Learning to spawn level segments (chunks) dynamically at runtime based on player position.
2.  **Memory Management:** Effectively **"purging" or queue-freeing** off-screen chunks to optimize performance and prevent memory leaks.
3.  **Algorithmic Variety:** Utilizing **randomization algorithms** to ensure building placement remains challenging, fair, and engaging for an endless loop.

**The repository will be updated once the procedural generator is fully integrated with the existing physics engine.**

---

## 🛠️ Technical Details
* **Engine:** Godot 4.x
* **Language:** GDScript
* **Key Concepts:** Vector Math (Dot Product), Raycasting, Singleton Patterns, State Machines.
