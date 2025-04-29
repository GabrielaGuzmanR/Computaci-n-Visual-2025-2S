# Taller - Convoluciones Personalizadas

## Objetivo
Este taller implementa filtros personalizados para procesar imágenes mediante convolución 2D, explorando su impacto visual en tareas como enfoque, suavizado y detección de esquinas. El enfoque está en entender la convolución manualmente y compararla con herramientas optimizadas como OpenCV.

## Lógica de Convolución
La convolución 2D aplica un kernel (matriz pequeña) a cada píxel de una imagen, calculando una suma ponderada de los píxeles vecinos para producir un nuevo valor. La implementación manual en Python:
1. Itera sobre cada píxel de la imagen.
2. Extrae una región del tamaño del kernel (e.g., 3x3).
3. Multiplica elemento a elemento la región por el kernel y suma los resultados.
4. Normaliza la salida para mantener los valores en el rango [0, 255].

### Diferencias con OpenCV
- **Manual**: Usa bucles en Python, lo que es lento (puede tomar segundos o minutos para imágenes grandes, e.g., 512x512 píxeles). Es educativa, pero ineficiente.
- **OpenCV (`cv2.filter2D`)**: Implementada en C++, optimizada con vectorización y paralelización, es mucho más rápida (milisegundos). Ideal para aplicaciones reales.

### Rendimiento
La implementación manual es significativamente más lenta debido a los bucles anidados en Python. Para mitigar esto, se recomienda usar imágenes pequeñas (e.g., 128x128 píxeles) durante el desarrollo, lo que reduce el tiempo de ejecución de minutos a segundos.

## Kernels Diseñados
1. **Enfoque (Sharpen)**: Resalta detalles amplificando el píxel central y restando los vecinos. Kernel: `[[0, -1, 0], [-1, 5, -1], [0, -1, 0]]`.
2. **Suavizado (Blur)**: Promedia los píxeles vecinos para reducir ruido (filtro de caja). Kernel: `[[1/9, 1/9, 1/9], [1/9, 1/9, 1/9], [1/9, 1/9, 1/9]]`.
3. **Detección de Esquinas**: Combina derivadas Sobel (x, y) para detectar esquinas mediante el producto de los kernels Sobel. Resultado: kernel derivado de `sobel_x * sobel_y`.

## Evidencias Visuales
- **IMAGEN 1**: Imagen original en escala de grises.
![original](https://github.com/user-attachments/assets/e368f334-5072-4ab0-b62c-45157301406c)
- **GIF 1**: Resultados de los filtros personalizados (enfoque, suavizado, esquinas) aplicados manualmente.
![convolution_results](https://github.com/user-attachments/assets/6e2a1b85-f5ae-4ca6-a496-e372c663987a)
- **IMAGEN 2**: Comparación visual entre la convolución manual y los resultados de OpenCV.
![comparison_with_text](https://github.com/user-attachments/assets/d7abb1ea-71f8-493a-828c-96c783ec00b6)

## Código
El código está en `python/convolution_filters.ipynb`. Características principales:
- Carga de imagen en escala de grises usando OpenCV.
- Implementación manual de convolución 2D con NumPy, incluyendo padding y normalización.
- Definición de tres kernels personalizados (enfoque, suavizado, esquinas).
- Comparación con `cv2.filter2D` para validar los resultados.
- Interfaz interactiva con trackbars para ajustar los valores del kernel en tiempo real.
- Visualización de resultados usando Matplotlib.

El código está comentado extensivamente para explicar cada función, los pasos clave, y las decisiones técnicas. Para ejecutar:
1. Instalar dependencias: `pip install opencv-python numpy matplotlib`.
2. Colocar una imagen (e.g., `sample_image.jpg`) en el directorio.
3. Ejecutar `convolution_filters.py`.

*Recomendación*: Usa imágenes pequeñas (e.g., 128x128 píxeles) para reducir el tiempo de ejecución de la convolución manual.

## Prompts Usados
- "Implementar una convolución 2D manual en Python con NumPy, incluyendo padding y normalización."
- "Diseñar kernels para enfoque, suavizado y detección de esquinas basados en derivadas Sobel."
- "Crear una interfaz interactiva con trackbars en OpenCV para ajustar un kernel 3x3 en tiempo real."
- "Explicar por qué la convolución manual es lenta y cómo optimizarla para el taller."

## Aprendizaje
- **Impacto visual**: Los kernels modifican drásticamente la imagen:
  - Enfoque resalta bordes y detalles, pero puede amplificar ruido.
  - Suavizado reduce ruido, pero sacrifica nitidez.
  - Detección de esquinas es sensible a patrones complejos, aunque puede ser ruidosa sin preprocesamiento.
- **Rendimiento**: La convolución manual es útil para aprender, pero impráctica para imágenes grandes debido a los bucles en Python. OpenCV es la opción preferida en la práctica.
- **Interactividad**: La interfaz con trackbars permite experimentar dinámicamente con los valores del kernel, revelando cómo pequeños cambios afectan el resultado.
- **Optimización**: Reducir el tamaño de la imagen es la forma más efectiva de acelerar la convolución manual sin alterar la lógica.

## Instrucciones para Ejecutar
1. Instalar dependencias: `pip install opencv-python numpy matplotlib`.
2. Colocar una imagen en el directorio (e.g., `sample_image.jpg`). Opcionalmente, redimensionarla a 128x128 píxeles:
   ```python
   img = cv2.imread('sample_image.jpg', cv2.IMREAD_GRAYSCALE)
   img = cv2.resize(img, (128, 128))
   cv2.imwrite('sample_image.jpg', img)
3. Ejecutar convolution_filters.py para:
  - Generar convolution_results.png con la comparación visual.
