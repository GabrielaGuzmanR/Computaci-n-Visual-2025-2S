# Taller - Análisis de Figuras Geométricas

## Objetivo
El objetivo de este taller fue detectar formas geométricas simples (círculo, cuadrado, triángulo) en una imagen binarizada y calcular sus propiedades geométricas: área, perímetro y centroide. También implementé una clasificación automática de las formas según el número de vértices y generé un GIF animado para mostrar el proceso paso a paso.

## Proceso
1. **Generación de la imagen**: Creé una imagen binarizada de 600x600 píxeles con tres figuras (círculo, cuadrado, triángulo) usando OpenCV. Las figuras se dibujaron en blanco sobre un fondo negro para facilitar la binarización.
2. **Binarización**: Apliqué un umbral (`cv2.threshold`) para asegurar que la imagen tuviera valores de 0 (fondo) y 255 (figuras).
3. **Detección de contornos**: Usé `cv2.findContours` para identificar los contornos de las figuras.
4. **Cálculo de métricas**:
   - **Área**: Calculada con `cv2.contourArea`.
   - **Perímetro**: Calculado con `cv2.arcLength`.
   - **Centroide**: Obtenido a partir de los momentos (`cv2.moments`) para calcular las coordenadas (cx, cy).
5. **Clasificación de formas**: Usé `cv2.approxPolyDP` para aproximar los contornos y clasificar las formas según el número de vértices (3: triángulo, 4: cuadrado, más: círculo).
6. **Visualización**: Dibujé los contornos en verde y etiqueté cada figura con sus métricas (área, perímetro, centroide) y nombre en una imagen en color.
7. **Generación de GIF**: Creé un GIF animado con cuatro etapas (imagen original, contornos, métricas, clasificación), cada una mostrada durante 3 segundos (ajusté a 1000 ms para transiciones más dinámicas en una prueba), usando `imageio.v2`.

## Evidencia
El siguiente GIF muestra el proceso paso a paso:
![animacion (1)](https://github.com/user-attachments/assets/37d46b22-083f-4f17-be25-df54e6a6ad73)


## Código
El código completo está disponible en: [[geometric_shapes_analysis.py](python/geometric_shapes_analysis.py)](https://colab.research.google.com/drive/1t2vOEY9Mndjb0JRS1ZDZTvbHpi5iSnVu?usp=sharing)

### Resumen del Código
- **Librerías**: `opencv-python`, `numpy`, `matplotlib`, `imageio.v2`.
- **Estructura**:
  - Creación o carga de la imagen binarizada.
  - Detección y procesamiento de contornos.
  - Cálculo y etiquetado de métricas.
  - Clasificación de formas.
  - Generación de imágenes intermedias (`original.png`, `contornos.png`, `metricas.png`, `resultado.png`) y un GIF animado.

## Reflexión
Este taller fue una gran oportunidad para aprender sobre procesamiento de imágenes con OpenCV. Enfrenté y resolví varios desafíos:
- **Error de carga de imagen**: Un error inicial (`cv2.imread` falló) se debía a que la imagen no existía. Lo solucioné creando una imagen de prueba con figuras geométricas.
- **GIF estático**: El GIF no mostraba animación porque las imágenes eran similares. Lo corregí generando copias distintas para cada etapa (original, contornos, métricas, clasificación).
- **Duración del GIF**: Ajusté la duración de los frames a 3 segundos por etapa, pero probé con 1000 ms (1 segundo) para lograr transiciones más rápidas y visibles, lo que mejoró la animación.
- **Posicionamiento de texto**: Asegurar que las etiquetas (área, perímetro, centroide, nombre) no se superpusieran fue un reto, especialmente en figuras pequeñas.

El taller me permitió dominar conceptos como contornos, momentos y aproximaciones poligonales, y mejorar mis habilidades de documentación y visualización.

## Prompts Usados
Utilicé asistencia de Grok (xAI) para resolver problemas y optimizar el proyecto. Los prompts incluyeron:
- Solucionar un error de OpenCV (`error: (-215:Assertion failed) !_src.empty() in function 'cvtColor'`) causado por una imagen no encontrada.
- Mejorar el diseño de las figuras geométricas para que fueran más atractivas y bien distribuidas.
- Corregir un GIF estático que no mostraba animación, asegurando etapas distintas.
- Ajustar la duración del GIF a 3 segundos por frame (y probar con 1000 ms para transiciones).

## Conclusión
El taller cumplió con los objetivos de detectar, analizar y clasificar figuras geométricas, además de visualizar el proceso mediante un GIF animado. La asistencia de Grok fue clave para superar desafíos técnicos y presentar un proyecto claro y completo. Estoy satisfecho con el resultado y las habilidades adquiridas.
