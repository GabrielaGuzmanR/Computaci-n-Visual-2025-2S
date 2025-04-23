
# 3D con React Three Fiber: Cubo Animado

**Descripción**
Este proyecto es una aplicación web que utiliza React Three Fiber para renderizar una escena 3D. Muestra un cubo naranja animado que realiza las siguientes transformaciones:

* Movimiento circular: El cubo se desplaza en una trayectoria circular en el plano XZ.
* Rotación: Gira sobre su propio eje Y.
Escalado: Cambia de tamaño de forma suave usando una función sinusoidal.

**Tecnologías Utilizadas**

React: Biblioteca para construir la interfaz de usuario.
React Three Fiber: Wrapper de Three.js para React.
Three.js: Biblioteca para renderizar gráficos 3D.
Vite: Herramienta de construcción y servidor de desarrollo.
@react-three/drei: Utilidades adicionales para React Three Fiber.

**Requisitos**

Node.js: Versión ^18.0.0, ^20.0.0, o >=22.0.0.
npm: Para instalar las dependencias.

**Instalación**
Sigue estos pasos para ejecutar el proyecto localmente:

Clonar el repositorio:
```bash
git clone [https://github.com/tu-usuario/tu-repositorio.git](https://github.com/GabrielaGuzmanR/Computacion-Visual-2025-2S.git)
```

Navegar a la carpeta del proyecto:
```bash
cd /Computacion-Visual-2025-2S/2025-04-15_taller1_transformaciones/threejs
```

Instalar las dependencias:
```bash
npm install
```

Iniciar el servidor de desarrollo:
```bash
npm run dev
```

Abrir el proyecto: Abre tu navegador y ve a http://localhost:5173. Deberías ver un cubo naranja animado en una escena 3D.


**Estructura del Proyecto**

src/main.jsx: Punto de entrada de la aplicación, configura el canvas y renderiza la escena.
src/scene.jsx: Define el cubo animado y las transformaciones (movimiento, rotación, escalado).
src/style.css: Estilos para asegurar que el canvas ocupe toda la pantalla.
index.html: Plantilla HTML principal.
