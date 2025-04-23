# Proyecto en Processing: Cubo 3D Animado
**Descripción**
Este proyecto es un sketch en Processing que utiliza gráficos 3D para mostrar un cubo animado. El cubo realiza las siguientes transformaciones en función del tiempo:

* Movimiento ondulado: Se traslada en los ejes X, Y y Z usando funciones sin() y cos().
* Rotación: Gira en los ejes X, Y y Z con velocidades diferentes.
* Escalado cíclico: Cambia de tamaño entre 0.5 y 1.5 usando sin().

El sketch utiliza pushMatrix() y popMatrix() para aislar las transformaciones y frameCount para animar las transformaciones en el tiempo. El fondo también cambia dinámicamente para añadir un efecto visual.

**Tecnologías Utilizadas**

* Processing: Entorno de programación para gráficos y animaciones.
* P3D: Renderizador 3D de Processing.

**Requisitos**

Processing: Descarga e instala Processing desde processing.org.
Un editor de texto o el IDE de Processing para abrir y ejecutar el archivo .pde.

**Instalación y Ejecución**
Sigue estos pasos para ejecutar el proyecto:

Clonar el repositorio:
```bash
git clone [https://github.com/tu-usuario/tu-repositorio.git](https://github.com/GabrielaGuzmanR/Computacion-Visual-2025-2S.git)
```

Navegar a la carpeta del proyecto:
```bash
cd /Computacion-Visual-2025-2S/2025-04-15_taller1_transformaciones/processing
```


**Abrir el sketch en Processing:**

1. Abre el archivo cubo_animado.pde en el IDE de Processing.
2. Haz clic en el botón "Run" (triángulo) o presiona Ctrl+R para ejecutar el sketch.


**Ver el resultado:**

Deberías ver un cubo amarillo-naranja que se mueve de forma ondulada, gira en los tres ejes y cambia de tamaño cíclicamente, sobre un fondo dinámico.


**Estructura del Proyecto**
cubo_animado.pde: Archivo principal de Processing que contiene el código del sketch.


