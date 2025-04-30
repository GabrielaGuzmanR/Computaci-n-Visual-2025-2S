# Taller - Segmentando el Mundo: Binarización y Reconocimiento de Formas

## Descripción
Este taller se centra en la segmentación de imágenes mediante técnicas de binarización y reconocimiento de formas simples. Se implementaron las siguientes tareas:
- Carga de una imagen en escala de grises con formas simples (círculo y cuadrado).
- Aplicación de segmentación binaria usando:
  - Umbral fijo (`cv2.threshold`).
  - Umbral adaptativo (`cv2.adaptiveThreshold`).
- Detección de contornos con `cv2.findContours`.
- Cálculo y visualización de:
  - Centros de masa de las formas usando `cv2.moments`.
  - Bounding boxes con `cv2.boundingRect`.
- Cálculo de métricas: número de formas detectadas, área promedio y perímetro promedio.
- Visualización de resultados: imagen original, imágenes binarizadas, y contornos con centros y bounding boxes.
- **Bonus**: Procesamiento automático de secuencias de imágenes (video) en Google Colab, mostrando resultados cuadro por cuadro.
- Generación de GIFs animados que muestran:
  - Imagen original.
  - Imagen segmentada (umbral adaptativo).
  - Resultado con contornos, centros y bounding boxes.

Todas las imágenes para los GIFs se redimensionaron a 600x600 píxeles para consistencia.

## Herramientas Utilizadas
- **Python**: Entorno principal (Google Colab).
- **OpenCV**: Segmentación, detección de contornos y visualización.
- **NumPy**: Operaciones matriciales y cálculos de métricas.
- **Matplotlib**: Visualización de resultados estáticos.
- **google.colab.patches (cv2_imshow)**: Visualización en Colab para el bonus.
- **imageio** (sugerido): Para generar GIFs animados.

## Resultados

### GIF Animado
![segmentation_results](https://github.com/user-attachments/assets/1969023e-b798-4e6b-a569-fcda58fdcb1b)


- Muestra:
  - Imagen original (`formas.png` con un círculo y un cuadrado).
  - Imagen segmentada con umbral adaptativo.
  - Resultado con contornos (azules), centros de masa (rojos) y bounding boxes (verdes).
- Todas las imágenes se redimensionaron a 600x600 píxeles para consistencia en el GIF.

### Bonus: Procesamiento de Video

- Muestra el procesamiento de un video (`video.mp4`) cuadro por cuadro en Colab:
  - Cuadro original.
  - Cuadro segmentado con umbral adaptativo.
  - Cuadro con contornos, centros y bounding boxes, junto con métricas (número de formas, área promedio, perímetro promedio).

## Proceso
1. **Instalación**:
   ```bash
   pip install opencv-python numpy matplotlib imageio
   ```

2. **Carga de la Imagen**:
   - Se cargó una imagen estática (`formas.png`) en escala de grises usando `cv2.imread`.

3. **Segmentación Binaria**:
   - Umbral fijo con `cv2.threshold` (inverso para detectar contornos oscuros).
   - Umbral adaptativo con `cv2.adaptiveThreshold` (parámetros ajustados: ventana de 21 y C=5).
   - Se aplicó dilatación (`cv2.dilate`) para engrosar los contornos y mejorar la detección.

4. **Detección de Formas**:
   - Contornos detectados con `cv2.findContours` (modo `RETR_EXTERNAL`).
   - Cálculo de centros de masa (`cv2.moments`) y bounding boxes (`cv2.boundingRect`).
   - Visualización de contornos (azules), centros (rojos) y bounding boxes (verdes).

5. **Métricas**:
   - Número de formas detectadas.
   - Área promedio y perímetro promedio calculados con `cv2.contourArea` y `cv2.arcLength`.

6. **Visualización Estática**:
   - Generación de una figura con `matplotlib` mostrando:
     - Imagen original.
     - Umbral fijo.
     - Umbral adaptativo.
     - Imagen con contornos.

7. **Bonus: Procesamiento de Video**:
   - Procesamiento de un video (`video.mp4`) cuadro por cuadro.
   - Uso de `cv2_imshow` en lugar de `cv2.imshow` para compatibilidad con Colab.
   - Límite de 50 cuadros para no saturar la salida.
   - Visualización de métricas en tiempo real en cada cuadro.

8. **Generación de GIFs**:
   - Se generaron imágenes individuales desde `resultados_segmentacion.png` (para la imagen estática).
   - Para el video, se capturaron cuadros procesados manualmente (puedes usar herramientas como `imageio` para automatizar).
   - Se redimensionaron todas las imágenes a 600x600 píxeles con `cv2.resize`.
   - Se usó una herramienta externa (como ezgif.com o `imageio`) para crear los GIFs.

## Código
El código está en `python/segmentacion_formas.ipynb`. Requisitos:
- Colocar la imagen estática en el directorio de trabajo como `formas.png`.
- Subir un video como `video.mp4` para el bonus (en Colab, usar el panel lateral para subir archivos).

## Prompts
El desarrollo del taller se realizó en colaboración con Grok, una IA de xAI, mediante prompts interactivos para implementar, depurar y mejorar el código. A continuación, se presenta una bitácora de nuestra conversación, detallando los errores encontrados, las correcciones aplicadas y los resultados obtenidos:

### Bitácora de Conversación
1. **Error inicial: Detección incorrecta de formas**:
   - **Problema**: El código inicial detectaba solo una forma en la imagen, aunque contenía un círculo y un cuadrado.
   - **Corrección**: Se ajustó la umbralización eliminando la inversión manual y usando `cv2.THRESH_BINARY_INV`. También se aplicó una dilatación (`cv2.dilate`) para engrosar los contornos, asegurando que el círculo y el cuadrado se detectaran como regiones separadas.
   - **Resultado**: El código detectó correctamente 2 formas (círculo y cuadrado), y las métricas (área y perímetro promedio) se calcularon correctamente.

2. **Error en el bonus: `cv2.imshow()` no soportado en Colab**:
   - **Problema**: Al implementar el bonus (procesamiento de video), se usó `cv2.imshow()`, pero esta función está deshabilitada en Colab y causaba un error (`DisabledFunctionError`).
   - **Corrección**: Se reemplazó `cv2.imshow()` por `cv2_imshow` de `google.colab.patches`. También se añadió un límite de cuadros (`max_cuadros = 50`) y un retraso (`time.sleep(0.5)`) para evitar saturar la salida en Colab.
   - **Resultado**: El procesamiento de video funcionó en Colab, mostrando los resultados cuadro por cuadro con métricas en tiempo real.

### Resumen
La colaboración con Grok permitió implementar el taller, resolver problemas de detección de formas y compatibilidad con Colab, y cumplir los requisitos del bonus y los GIFs animados. La bitácora refleja un proceso iterativo de depuración y mejora.

## Reflexión
- **Segmentación binaria**: Aprendí la importancia de ajustar los parámetros de umbralización (como el tamaño de la ventana y el valor C en `cv2.adaptiveThreshold`) para detectar correctamente formas con contornos delgados.
- **Operaciones morfológicas**: La dilatación fue clave para mejorar la detección de formas, especialmente cuando los contornos son delgados y el umbral adaptativo no produce regiones blancas bien definidas.
- **Procesamiento de video en Colab**: Usar `cv2_imshow` fue una solución efectiva para visualizar resultados en Colab, aunque la salida cuadro por cuadro es más lenta que en un entorno local con `cv2.imshow()`.
- **Dificultades**: La principal dificultad fue la detección inicial de formas, resuelta con ajustes en la umbralización y dilatación. También fue un desafío adaptar el procesamiento de video a Colab debido a las limitaciones de visualización.
- **Imágenes ideales**: Este enfoque funciona bien para imágenes con formas simples y contraste claro (como contornos oscuros sobre fondo blanco). Para imágenes más complejas, podrían necesitarse técnicas adicionales como eliminación de ruido o segmentación más avanzada.

## Estructura del Repositorio
```
2025-04-29_taller_segmentacion_formas/
├── python/
│   ├── segmentacion_formas.ipynb
│   ├── formas.png
│   ├── video.mp4
│   ├── resultados_segmentacion.png
├── README.md
```
