import React, { useRef } from "react"; // Modifica esta línea
import { useFrame } from "@react-three/fiber";

function Scene() {
  const cubeRef = useRef();

  useFrame(({ clock }) => {
    const elapsedTime = clock.getElapsedTime();

    // Traslación en trayectoria circular
    const radius = 2;
    cubeRef.current.position.x = Math.cos(elapsedTime) * radius;
    cubeRef.current.position.z = Math.sin(elapsedTime) * radius;

    // Rotación sobre su propio eje (Y)
    cubeRef.current.rotation.y += 0.02;

    // Escalado suave con Math.sin
    const scale = 1 + 0.5 * Math.sin(elapsedTime);
    cubeRef.current.scale.set(scale, scale, scale);
  });

  return (
    <>
      <mesh ref={cubeRef} position={[0, 0, 0]}>
        <boxGeometry args={[1, 1, 1]} />
        <meshStandardMaterial color="orange" />
      </mesh>
      <gridHelper args={[10, 10]} />
    </>
  );
}

export default Scene;