# Taller de Segmentación Semántica - SAM

## Descripción
Este taller implementa segmentación semántica utilizando **Segment Anything Model (SAM)** de Meta AI, siguiendo los pasos del taller proporcionado. SAM segmenta objetos en imágenes usando puntos o cajas como prompts. El código carga una imagen, segmenta un objeto con un punto, genera máscaras con contornos de colores distintos (rojo, verde, azul) y crea un GIF animado que muestra la imagen original, las máscaras coloreadas y las máscaras binarias, todas redimensionadas y convertidas a RGB para consistencia.

## Modelo Utilizado
- **SAM (Segment Anything Model)**:
  - Versión: `vit_h`.
  - Checkpoint: `sam_vit_h_4b8939.pth`.
  - Descripción: Modelo flexible para segmentar objetos arbitrarios mediante prompts interactivos (puntos o cajas).

## Resultados
### Imagen Original
![imagen_original](https://github.com/user-attachments/assets/789f0fb0-90f2-4663-96d0-1842f42a257f)

### Máscaras Generadas
- Máscara 0 (Contorno rojo):
  
![mask_colored_0](https://github.com/user-attachments/assets/c0e24c18-9005-4151-bc92-8032fc3e29c3)


- Máscara 1 (Contorno verde):
  
![mask_colored_1](https://github.com/user-attachments/assets/2312dbc3-6120-4ee7-908f-e14350311f0a)


- Máscara 2 (Contorno azul):
  
![mask_colored_2](https://github.com/user-attachments/assets/0d4637c8-b0d4-411c-8f8e-3dd8a6cc4ead)


### Máscaras Binarias
Guardadas en `mascaras_salida/mask_0.png`, `mask_1.png`, etc.

### GIF Animado
![segmentation_process](https://github.com/user-attachments/assets/c76782e3-c1a6-4978-a9c3-d6434550d043)

- Muestra:
  - Imagen original.
  - Para cada máscara: imagen con contornos coloreados (rojo, verde, azul) y máscara binaria (blanco y negro).
- Todas las imágenes se redimensionan al tamaño de la imagen original y se convierten a RGB (3 canales) para consistencia.

## Proceso
1. **Instalación**:
   ```bash
   pip install git+https://github.com/facebookresearch/segment-anything.git
   pip install supervision opencv-python matplotlib imageio
   ```
2. Carga de la imagen (`imagenes_entrada/imagen.jpg`) y el modelo SAM (`sam_vit_h_4b8939.pth`).
3. Segmentación usando un punto en [300, 300].
4. Visualización de máscaras con contornos de colores distintos (rojo, verde, azul) usando `cv2.findContours`.
5. Generación de un GIF animado con `imageio.v2` mostrando la imagen original, máscaras coloreadas y máscaras binarias.

## Código
El código está en `sam_segmentation.py`. Requisitos:
- Descargar `sam_vit_h_4b8939.pth` desde [este enlace](https://dl.fbaipublicfiles.com/segment_anything/sam_vit_h_4b8939.pth).
- Colocar una imagen en `imagenes_entrada/imagen.jpg`.

## Prompts
El desarrollo del taller se realizó en colaboración con Grok, una IA de xAI, mediante prompts interactivos para implementar, depurar y mejorar el código. A continuación, se presenta una bitácora de nuestra conversación, detallando los errores encontrados, las correcciones aplicadas y los resultados obtenidos:

### Bitácora de Conversación
1. **Error inicial: Checkpoint no encontrado** (`FileNotFoundError: sam_vit_h.pth`):
   - **Problema**: El código asumía que el checkpoint `sam_vit_h.pth` estaba en el directorio, pero no existía.
   - **Corrección**: Actualicé el código para usar `sam_vit_h_4b8939.pth` y añadí una verificación de existencia con instrucciones para descargarlo.
   - **Resultado**: El modelo SAM se cargó correctamente tras descargar el checkpoint.

2. **Error de CUDA** (`RuntimeError: Found no NVIDIA driver`):
   - **Problema**: El código intentaba usar GPU (`to("cuda")`), pero no había una GPU disponible.
   - **Corrección**: Cambié a `to("cpu")` para ejecutar en CPU, compatible con entornos sin GPU.
   - **Resultado**: El código se ejecutó sin problemas en CPU, aunque con mayor tiempo de procesamiento.

3. **Error de dimensiones en el GIF** (`ValueError: all input arrays must have the same shape`):
   - **Problema**: Las imágenes (original, coloreadas, binarias) tenían dimensiones o canales diferentes (p.ej., RGB vs. escala de grises).
   - **Corrección inicial**: Añadí `prepare_image_for_gif` para redimensionar y convertir a RGB, pero el error persistió.
   - **Corrección actual**: Usé `PIL` para cargar imágenes, forzando RGB y eliminando márgenes con `pad_inches=0` en `plt.savefig`. Añadí verificación de formas (`frame_shapes`) antes de generar el GIF.
   - **Resultado esperado**: Todas las imágenes tendrán la misma forma (p.ej., `(H, W, 3)`), resolviendo el error.

### Resumen
La colaboración con Grok permitió implementar el taller, solucionar errores relacionados con la carga del modelo, ejecución en CPU, visualización de contornos, y generación del GIF. La bitácora refleja un proceso iterativo de depuración y mejora, cumpliendo los requisitos del taller.

## Reflexión
- **Diferencias entre métodos**: SAM es interactivo y flexible, ideal para segmentar objetos no predefinidos, mientras que DeepLabV3 segmenta clases preentrenadas automáticamente pero está limitado a categorías específicas.
- **Imágenes ideales**: SAM destaca en imágenes con objetos variados o complejos (p.ej., escenas naturales), mientras que DeepLabV3 es mejor para escenas con clases estándar (p.ej., personas, vehículos).
- **Colores distintos**: Usar colores diferentes (rojo, verde, azul) para cada máscara mejora la diferenciación visual.
- **GIF animado**: El GIF muestra el proceso completo, incluyendo máscaras coloreadas y binarias, con dimensiones y canales (RGB) consistentes para una visualización fluida.

## Estructura del Repositorio
```
2025-04-29_taller_segmentacion_semantica_sam_deeplab/
├── colab_notebooks/
├── imagenes_entrada/
│   └── imagen.jpg
├── mascaras_salida/
│   └── mask_0.png, mask_1.png, ...
├── resultados/
│   └── imagen_original.png, mask_colored_0.png, ..., segmentation_process.gif
├── README.md
```
