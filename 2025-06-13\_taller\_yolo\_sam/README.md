# 🧪 Taller Práctico 4 – Detección y Segmentación con YOLO + SAM

## 📅 Fecha
`2025-06-14` - Fecha de finalización

---

## 🎯 Objetivo del Taller

Integrar YOLOv8 para la detección de objetos y el modelo Segment Anything (SAM) para la segmentación de instancias, creando un pipeline de visión por computador que detecta objetos, segmenta sus siluetas y aplica un análisis creativo (pixelado del fondo). El objetivo es combinar modelos preentrenados para localizar, segmentar y analizar regiones en imágenes, generando métricas y visualizaciones.

---

## 🧠 Conceptos Aprendidos

Los principales conceptos aplicados en este taller fueron:

- [x] Detección de objetos con YOLOv8 (modelo preentrenado `yolov8n.pt`)
- [x] Segmentación de instancias usando SAM con cajas delimitadoras como prompts
- [x] Manipulación de imágenes con OpenCV (dibujo de cajas, máscaras, recortes)
- [x] Análisis visual: cálculo de áreas y conteo de objetos por clase
- [x] Visualización de resultados con Matplotlib (cajas, máscaras, fondo pixelado)
- [x] Generación de recortes y máscaras individuales para cada objeto
- [x] Aplicación creativa: pixelado del fondo con Gaussian Blur
- [ ] Procesamiento de video cuadro a cuadro (opcional, no implementado)
- [ ] Integración con GroundingDINO para segmentación basada en texto
- [ ] Interfaz interactiva con Gradio

---

## 📖 Descripción Breve de las Técnicas Implementadas

### Instalación de Dependencias

Se instalaron las librerías `ultralytics` para YOLOv8 y `segment-anything` desde su repositorio de GitHub, junto con el modelo preentrenado SAM (`sam_vit_h_4b8939.pth`). Se configuraron directorios para almacenar recortes y segmentaciones.

**Ubicación**: `yolo_sam_pipeline.ipynb` (celdas 2-3)

### Detección de Objetos con YOLO

Se utilizó YOLOv8 (`yolov8n.pt`) para detectar objetos en una imagen de ejemplo (`images/ejemplo1.jpg`). La función `detectar_objetos_yolo` retorna las coordenadas de las cajas delimitadoras (`xyxy`), las clases detectadas (e.g., "cat", "dog") y la imagen original.

**Ubicación**: `yolo_sam_pipeline.ipynb` (celda 4)

### Segmentación con SAM

El modelo SAM (`vit_h`) se configuró con `SamPredictor` para segmentar las regiones correspondientes a las cajas de YOLO. La función `segmentar_con_sam` genera máscaras binarias precisas para cada objeto detectado.

**Ubicación**: `yolo_sam_pipeline.ipynb` (celda 5)

### Visualización de Resultados

La función `visualizar_deteccion_segmentacion` muestra la imagen con:
- Cajas delimitadoras y etiquetas de clase superpuestas.
- Máscaras segmentadas con un color cian semitransparente.
Se generan recortes individuales de cada objeto (fondo blanco) y máscaras binarias, guardados en `outputs/recortes` y `outputs/segmentaciones`.

**Ubicación**: `yolo_sam_pipeline.ipynb` (celda 6)

### Análisis Creativo: Pixelado del Fondo

La función `analizar_segmentaciones` aplica un desenfoque Gaussian (kernel 21x21) al fondo, preservando las regiones segmentadas. Calcula métricas como el área en píxeles y el porcentaje del área total para cada objeto, y genera un DataFrame con los datos de cada región.

**Ubicación**: `yolo_sam_pipeline.ipynb` (celda 7)

### Pipeline Completo

La función `main` integra todos los pasos: detección, segmentación, visualización y análisis. Procesa una imagen de ejemplo, detectando un perro y un gato, y produce resultados visuales y métricas.

**Ubicación**: `yolo_sam_pipeline.ipynb` (celda 8)

---

## 🔧 Herramientas y Entorno

- **Python** con:
  - **Ultralytics** (YOLOv8) para detección de objetos
  - **Segment Anything (SAM)** para segmentación de instancias
  - **OpenCV** para manipulación de imágenes
  - **Matplotlib** para visualización
  - **NumPy** y **Pandas** para análisis de datos
- Entorno: Google Colab (CPU/GPU)
- Dataset: Imagen de ejemplo (`images/ejemplo1.jpg`)

---

## 📁 Estructura del Proyecto

```
2025-06-14_taller_yolo_sam/
├── yolo_sam_pipeline.ipynb
├── images/
│   └── ejemplo1.jpg
├── outputs/
│   ├── resultados.png
│   ├── recortes/
│   │   ├── dog_<uuid>.png
│   │   ├── cat_<uuid>.png
│   ├── segmentaciones/
│   │   ├── mask_dog_<uuid>.png
│   │   ├── mask_cat_<uuid>.png
│   ├── pixelado_fondo.png
├── sam_vit_h_4b8939.pth
└── README.md
```

---

## 🧪 Implementación

El pipeline combina YOLOv8 y SAM para detectar y segmentar objetos en una imagen de ejemplo con un perro y un gato. YOLOv8 identificó correctamente las clases y proporcionó cajas delimitadoras, que SAM utilizó para generar máscaras precisas. Se aplicó un análisis creativo pixelando el fondo, y se calcularon métricas como el área de cada objeto (22.99% para el perro, 14.45% para el gato).

### 🔹 Pasos Realizados
1. Instalación de dependencias y carga del modelo SAM.
2. Detección de objetos con YOLOv8, obteniendo cajas y clases.
3. Segmentación de instancias con SAM usando las cajas como prompts.
4. Visualización de cajas y máscaras, con guardado de recortes y máscaras individuales.
5. Aplicación de pixelado al fondo y cálculo de métricas (área, conteo por clase).

### 🔹 Código Clave

```python
# Detección con YOLO
def detectar_objetos_yolo(imagen_path):
    model = YOLO('yolov8n.pt')
    results = model(imagen_path)
    boxes = [box.xyxy[0].cpu().numpy().astype(int) for box in results[0].boxes]
    classes = [results[0].names[int(box.cls)] for box in results[0].boxes]
    return boxes, classes, results[0].orig_img
```

```python
# Segmentación con SAM
def segmentar_con_sam(imagen, boxes):
    sam = sam_model_registry["vit_h"](checkpoint="sam_vit_h_4b8939.pth")
    predictor = SamPredictor(sam)
    predictor.set_image(imagen)
    masks = [predictor.predict(box=box, point_labels=np.array([1]), multimask_output=False)[0][0] for box in boxes]
    return masks
```

```python
# Pixelado del fondo
def analizar_segmentaciones(imagen, masks, boxes, classes):
    img_pixelated = cv2.GaussianBlur(imagen, (21, 21), 0)
    combined_mask = np.zeros_like(imagen[:, :, 0], dtype=bool)
    for mask in masks:
        combined_mask |= mask
    result = np.where(np.stack([combined_mask]*3, axis=-1), imagen, img_pixelated)
    return pd.DataFrame(datos), conteo_clases
```

---

## 📊 Resultados Visuales

- **Cajas Delimitadoras y Máscaras**:

![image](https://github.com/user-attachments/assets/f26d56eb-50a9-4840-a0ee-8d12f04684d1)

  Muestra la imagen original con cajas verdes etiquetadas y máscaras cian superpuestas.

- **Fondo Pixelado**:

![image](https://github.com/user-attachments/assets/c6a3d6e3-4421-431f-a951-6d6a46e3128d)


  La imagen con el fondo desenfocado, preservando las regiones segmentadas (perro y gato).

- **Recortes y Máscaras**:
  - Recortes individuales (`dog_<uuid>.png`, `cat_<uuid>.png`) en `outputs/recortes`
  - Máscaras binarias (`mask_dog_<uuid>.png`, `mask_cat_<uuid>.png`) en `outputs/segmentaciones`

- **Métricas**:
  - **Conteo por clase**: 1 perro, 1 gato
  - **Área de objetos**:
    - Perro: 94,593 píxeles (22.99% del área total)
    - Gato: 59,457 píxeles (14.45% del área total)

```chartjs
{
  "type": "bar",
  "data": {
    "labels": ["Perro", "Gato"],
    "datasets": [{
      "label": "Área (%)",
      "data": [22.99, 14.45],
      "backgroundColor": ["#FF6F61", "#6B7280"],
      "borderColor": ["#D32F2F", "#374151"],
      "borderWidth": 1
    }]
  },
  "options": {
    "scales": {
      "y": {
        "beginAtZero": true,
        "title": {
          "display": true,
          "text": "Porcentaje del Área Total (%)"
        }
      }
    },
    "plugins": {
      "title": {
        "display": true,
        "text": "Área de Objetos Segmentados"
      }
    }
  }
}
```

---

## 🧩 Prompts Utilizados

Ejemplos de prompts que podrían haberse usado durante el desarrollo:

```text
"¿Cómo integrar YOLOv8 con SAM para segmentar objetos detectados en una imagen? Proporciona un ejemplo de código."
```

```text
"Estoy recibiendo un error en SamPredictor al usar box prompts. ¿Cómo configurar correctamente las entradas para segmentar con SAM?"
```

```text
"¿Cómo aplicar un filtro de desenfoque solo al fondo de una imagen, preservando las regiones segmentadas?"
```

```text
"Quiero calcular el área de cada máscara segmentada y guardarla en un CSV. ¿Cómo hacerlo con NumPy y Pandas?"
```

---

## 💬 Reflexión Final

Este taller me permitió combinar dos modelos de visión por computador de vanguardia (YOLOv8 y SAM) para construir un pipeline robusto de detección y segmentación. La integración de YOLO para localización y SAM para segmentación precisa demostró ser poderosa, logrando identificar y aislar un perro y un gato en una imagen de ejemplo con alta precisión. El análisis creativo (pixelado del fondo) y las métricas calculadas (área, conteo por clase) enriquecieron la aplicación práctica del pipeline.

**Desafíos**:
- Configurar SAM con `SamPredictor` y ajustar los prompts de las cajas de YOLO requirió entender la documentación de ambos modelos.
- La gestión de máscaras binarias y su combinación para el pixelado del fondo fue inicialmente compleja, especialmente para preservar las regiones segmentadas.
- El tiempo de procesamiento en Google Colab (CPU/GPU) fue notable debido al tamaño del modelo SAM (`vit_h`), lo que sugiere optimizaciones futuras (e.g., usar `vit_b`).

**Lecciones aprendidas**:
- La combinación de modelos preentrenados permite abordar tareas complejas con relativa facilidad, aprovechando sus fortalezas complementarias.
- La visualización de resultados (cajas, máscaras, fondo pixelado) es clave para interpretar el rendimiento del pipeline.
- El análisis de métricas (área, conteo) proporciona información valiosa para aplicaciones prácticas, como conteo de objetos o estimación de ocupación espacial.

**Oportunidades de mejora**:
- Procesar videos cuadro a cuadro para aplicaciones en tiempo real.
- Incorporar GroundingDINO para segmentación basada en texto, aumentando la flexibilidad.
- Optimizar el pipeline con modelos más ligeros o cuantización para reducir el tiempo de inferencia.
- Explorar técnicas adicionales, como cambio de color en regiones segmentadas o integración con interfaces interactivas (Gradio).

### Tabla de Comparación de Técnicas

| Técnica                     | Estado           | Impacto en Rendimiento | Notas                                                  |
|-----------------------------|------------------|------------------------|--------------------------------------------------------|
| Detección con YOLOv8        | ✅ Implementado   | Alto                  | Localización precisa de objetos (perro, gato)          |
| Segmentación con SAM        | ✅ Implementado   | Alto                  | Máscaras precisas basadas en cajas de YOLO             |
| Pixelado del Fondo          | ✅ Implementado   | Medio                 | Efecto visual claro, mejora privacidad en imágenes     |
| Cálculo de Áreas            | ✅ Implementado   | Medio                 | Métricas útiles para análisis cuantitativo             |
| Visualización de Resultados | ✅ Implementado   | Medio                 | Facilita la interpretación de detección y segmentación |
| Procesamiento de Video      | ❌ No implementado | Alto                | Requeriría optimización para tiempo real               |
| GroundingDINO + SAM         | ❌ No implementado | Alto                | Permitiría segmentación con prompts de texto           |

---

## ✅ Lista de Entrega

- [x] Carpeta `2025-06-14_taller_yolo_sam`
- [x] Implementación funcional en `yolo_sam_pipeline.ipynb`
- [x] Detección de objetos (perro, gato) con YOLOv8
- [x] Segmentación precisa con SAM
- [x] Visualizaciones (`resultados.png`, `pixelado_fondo.png`, recortes, máscaras)
- [x] Análisis de áreas y conteo por clase en DataFrame
- [x] Código limpio y comentado
- [x] README con descripción, resultados y reflexión
- [ ] Procesamiento de video (no implementado)
- [ ] Integración con GroundingDINO o Gradio (no implementado)

