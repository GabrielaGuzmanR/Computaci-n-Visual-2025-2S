
# Python: Animación de un Smiley Face con Transformaciones 2D
**Descripción**
Este proyecto es un notebook en Python (ejecutado en Google Colab o Jupyter Notebook) que crea una animación 2D de un smiley face. La figura se transforma con el tiempo aplicando traslación, rotación y escalado mediante matrices de transformación. La animación se exporta como un GIF.

**Características:**

* Figura 2D: Un smiley face compuesto por círculos (cabeza y ojos) y un arco (boca).
* Transformaciones:
  * Traslación: Movimiento ondulado en los ejes X e Y usando sin() y cos().
  * Rotación: Rotación continua alrededor del origen.
  * Escalado: Escalado cíclico que varía con el tiempo.


* Animación: Generada con matplotlib.animation.FuncAnimation, mostrando las transformaciones en función del tiempo.
* Exportación: La animación se guarda como smiley_animation.gif usando imageio.

**Tecnologías Utilizadas**

* Python: Lenguaje de programación principal.
* matplotlib: Para visualización y animación.
* numpy: Para manejar matrices y cálculos matemáticos.
* imageio: Para exportar la animación como GIF (con Pillow como fallback en Colab).

**Requisitos**

* Google Colab o Jupyter Notebook: Entorno para ejecutar el notebook.
* Librerías:
  * matplotlib
  * numpy
  * imageio (opcionalmente imageio-ffmpeg para evitar el warning de MovieWriter en Colab)



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

Copia el codigo en el archivo smiley_animation.ipynb en una celda de un Google Colab

Instalar las dependencias:
pip install matplotlib numpy imageio

Ejecuta todas las celdas (Shift + Enter).


**Ver el resultado:**

La animación se mostrará en el notebook. Un archivo smiley_animation.gif se generará en el directorio actual, mostrando el smiley face animado.


**Estructura del Proyecto**
* smiley_animation.ipynb: Notebook principal con el código de la animación.
* smiley_animation.gif: GIF generado con la animación del smiley face.

