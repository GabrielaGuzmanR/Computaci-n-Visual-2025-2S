# Taller - De Pixels a Coordenadas: Explorando la Imagen como Matriz

## Descripción
Este taller explora la representación de imágenes digitales como matrices numéricas usando Python, OpenCV, NumPy, y ipywidgets. Se implementaron las siguientes tareas:
- Carga de una imagen y visualización de canales RGB y HSV.
- Modificación de regiones mediante *slicing* (cambio de color y reemplazo de áreas).
- Generación de histogramas de intensidad para mostrar distribuciones de píxeles.
- Ajustes de brillo y contraste (manual y automático con `cv2.convertScaleAbs`).
- Creación de sliders interactivos para ajustar brillo/contraste en tiempo real.
- Generación de un GIF animado que muestra la imagen original, canales, modificaciones, y ajustes con sus histogramas, todos redimensionados a 600x600 píxeles para consistencia.

## Herramientas Utilizadas
- **Python**: Entorno principal (Colab).
- **OpenCV**: Manipulación de imágenes y ajustes de brillo/contraste.
- **NumPy**: Operaciones matriciales.
- **Matplotlib**: Visualización de imágenes y histogramas.
- **ipywidgets**: Sliders interactivos en Colab.
- **imageio**: Generación de GIF animado.

## Resultados

### GIF Animado

![image_processing](https://github.com/user-attachments/assets/7866d43e-f0a8-41e1-a2f3-f026532752ad)

- Muestra:
  - Imagen original.
  - Canales RGB (rojo, verde, azul).
  - Canales HSV (matiz, saturación, valor).
  - Modificaciones de regiones (rectángulo rojo, región reemplazada).
  - Ajustes de brillo/contraste (original, manual, automático), cada uno seguido de su histograma en escala de grises para mostrar cambios en la distribución de intensidad.
- Todas las imágenes se redimensionan a 600x600 píxeles y se convierten a RGB (3 canales) para consistencia.

### Ajuste Interactivo

![image](https://github.com/user-attachments/assets/016787ca-e401-4028-b669-b31117bcfa98)


## Proceso
1. **Instalación**:
   ```bash
   pip install opencv-python numpy matplotlib ipywidgets imageio
   ```
2. Carga de la imagen (`sample_image.jpg`) usando `cv2.imread`.
3. Separación de canales RGB y HSV con `cv2.split` y conversión a HSV con `cv2.cvtColor`.
4. Modificación de regiones mediante *slicing*: cambio de un área a rojo y reemplazo de una región por otra.
5. Generación de histogramas con `cv2.calcHist` para la imagen original y ajustada.
6. Ajustes de brillo/contraste: manual (ecuación `alpha * pixel + beta`) y automático (`cv2.convertScaleAbs`).
7. Creación de sliders interactivos con `ipywidgets` para ajustes en tiempo real.
8. Generación de un GIF animado con `imageio` que combina todas las imágenes y histogramas.

## Código
El código está en `python/image_matrix.ipynb`. Requisitos:
- Colocar una imagen en el directorio de trabajo como `sample_image.jpg`.

## Prompts
El desarrollo del taller se realizó en colaboración con Grok, una IA de xAI, mediante prompts interactivos para implementar, depurar y mejorar el código. A continuación, se presenta una bitácora de nuestra conversación, detallando los errores encontrados, las correcciones aplicadas y los resultados obtenidos:

### Bitácora de Conversación
1. **Error inicial: Funciones GUI no soportadas en Colab** (`error: (-2:Unspecified error) The function is not implemented`):
   - **Problema**: El código usaba `cv2.namedWindow` y `cv2.createTrackbar` para sliders interactivos, pero estas funciones no son compatibles con Google Colab.
   - **Corrección**: Reemplacé las funciones de OpenCV por `ipywidgets.FloatSlider` para crear sliders interactivos compatibles con Colab.
   - **Resultado**: Los sliders funcionaron correctamente en Colab, permitiendo ajustes de brillo/contraste en tiempo real.

### Resumen
La colaboración con Grok permitió implementar el taller, solucionar errores relacionados con la compatibilidad en Colab y la generación del GIF, y cumplir los requisitos de un único GIF animado. La bitácora refleja un proceso iterativo de depuración y mejora.

## Reflexión
- **Manipulación matricial**: Aprendí cómo las imágenes se representan como matrices numéricas y cómo manipular píxeles directamente con *slicing* y operaciones matriciales.
- **Histogramas y ajustes**: Los histogramas muestran cómo los ajustes de brillo (beta) y contraste (alpha) desplazan y escalan la distribución de intensidades, siendo más evidente en la imagen ajustada manualmente.
- **Interactividad en Colab**: Usar `ipywidgets` fue una solución efectiva para reemplazar las funciones GUI de OpenCV, aunque limita la experiencia en comparación con `cv2.createTrackbar` en entornos locales.
- **Dificultades**: La principal dificultad fue manejar las dimensiones de las imágenes para el GIF, resuelta con redimensionamiento. Configurar Colab para interactividad también requirió ajustes.
- **Imágenes ideales**: Este enfoque es ideal para imágenes con alto contraste o detalles variados, donde los canales HSV y los histogramas revelan información útil.

## Estructura del Repositorio
```
2025-04-29_taller_imagen_matriz_pixeles/
├── python/
│   └── image_matrix.ipynb
├── README.md
```
