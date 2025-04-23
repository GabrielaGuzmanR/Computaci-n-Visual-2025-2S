import React from "react"; // Añade esta línea
import { createRoot } from "react-dom/client";
import { Canvas } from "@react-three/fiber";
import { OrbitControls } from "@react-three/drei";
import Scene from "./scene.jsx";
import './style.css';

const root = createRoot(document.getElementById("root"));

function App() {
  return (
    <div style={{ width: "100vw", height: "100vh" }}>
      <Canvas
        camera={{ position: [0, 2, 5], fov: 50 }}
        style={{ background: "#000000" }}
      >
        <ambientLight intensity={1} />
        <directionalLight position={[5, 5, 5]} intensity={1} />
        <Scene />
        <OrbitControls />
      </Canvas>
    </div>
  );
}

root.render(<App />);