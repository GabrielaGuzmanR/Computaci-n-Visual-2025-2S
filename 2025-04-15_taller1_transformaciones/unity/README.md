## Proyecto en Unity: Animación de un Cubo 3D con Transformaciones

**Descripción**
Este proyecto es un proyecto en Unity (versión LTS) que crea una escena 3D básica con un cubo animado. El cubo aplica tres transformaciones en tiempo real: traslación aleatoria en los ejes X o Y cada 2 segundos, rotación constante en los tres ejes (X, Y, Z), y escalado oscilante que varía con el tiempo. Las transformaciones se implementan usando las funciones transform.Translate(), transform.Rotate(), y transform.localScale, como se requería en el taller.
**Características:**

* Escena 3D: Un cubo como objeto principal en una escena vacía.
* Transformaciones:
  * Traslación: Movimiento aleatorio en los ejes X o Y cada 2 segundos, usando transform.Translate().
  * Rotación: Rotación continua en los tres ejes (X, Y, Z) con velocidades de 15, 30 y 45 grados por segundo, usando transform.Rotate() y Time.deltaTime.
  * Escalado: Escalado cíclico que varía entre 0.5 y 1.5 usando Mathf.Sin(Time.time) y transform.localScale.
* Animación: Las transformaciones se actualizan en cada frame mediante el método Update() en un script de C#.
Interactividad: Los parámetros de rotación y escalado se pueden ajustar desde el Inspector de Unity.

**Tecnologías Utilizadas**

* Unity: Entorno de desarrollo para crear la escena 3D y la animación.
* C#: Lenguaje de programación usado para el script de animación (CubeMovement.cs).

**Requisitos**

* Unity (versión LTS): Asegúrate de tener instalada una versión LTS de Unity (como 2022.3 LTS o 2023.3 LTS). Puedes descargarla desde unity.com.
* Unity Hub: Recomendado para gestionar proyectos de Unity.
* Git: Para clonar el repositorio.

**Instalación y Ejecución**
Sigue estos pasos para ejecutar el proyecto:

Clonar el repositorio:
```bash
git clone [https://github.com/tu-usuario/tu-repositorio.git](https://github.com/GabrielaGuzmanR/Computacion-Visual-2025-2S.git)
```

Navegar a la carpeta del proyecto:
```bash
cd /Computacion-Visual-2025-2S/2025-04-15_taller1_transformaciones/python
```

Abrir el proyecto en Unity:

1. Abre Unity Hub.
2. Haz clic en "Add" y selecciona la carpeta 2025-04-15_taller1_transformaciones/unity (la que contiene las carpetas Assets, Packages, ProjectSettings, etc.).
3. Unity detectará automáticamente el proyecto y lo añadirá a tu lista de proyectos.
4. Haz clic en el proyecto para abrirlo en Unity.


5. Abrir la escena principal:

Una vez que el proyecto se abra en Unity, ve a la ventana "Project" (en la parte inferior).
Navega a Assets/Scenes y haz doble clic en la escena SampleScene (o el nombre que le hayas dado a la escena, como MainScene, si la renombraste).
Esto cargará la escena con el cubo animado.


Probar el proyecto:

En la ventana "Hierarchy", asegúrate de que el objeto Cube esté presente.
Haz clic en el botón Play (triángulo) en la parte superior de Unity.
Verás el cubo moviéndose aleatoriamente en los ejes X o Y cada 2 segundos, rotando continuamente, y cambiando de tamaño de manera oscilante.


Ajustar parámetros (opcional):

Selecciona el objeto Cube en la jerarquía.
En la ventana "Inspector", busca el componente Cube Movement (Script).
Puedes ajustar los valores de:
Rotation Speed (por defecto: 15, 30, 45 grados/segundo en los ejes X, Y, Z).
Scale Amplitude (por defecto: 0.5, controla cuánto varía el escalado).
Base Scale (por defecto: 1, la escala base del cubo).





Estructura del Proyecto

* Assets/: Carpeta principal que contiene los recursos del proyecto.
* Scenes/: Contiene la escena principal (SampleScene o MainScene).
* Scripts/: Contiene el script CubeMovement.cs que controla la animación del cubo.

* Packages/: Configuración de paquetes de Unity.
* ProjectSettings/: Configuración del proyecto.
* UserSettings/: Configuración del usuario.
