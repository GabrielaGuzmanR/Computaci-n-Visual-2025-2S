# Taller - Rasterización desde Cero: Dibujando con Algoritmos Clásicos

## Descripción
Este taller implementa algoritmos clásicos de rasterización para dibujar líneas, círculos y triángulos en una imagen píxel a píxel usando Python, Pillow y matplotlib. Los algoritmos implementados son:
1. **Algoritmo de Bresenham**: Dibuja líneas rectas optimizando la selección de píxeles basada en un cálculo de error.
2. **Algoritmo de Punto Medio**: Dibuja círculos aprovechando la simetría octante para reducir cálculos.
3. **Rellenado de Triángulos (Scanline)**: Rellena triángulos interpolando coordenadas para determinar los píxeles interiores.

## Imágenes Generadas
- **Línea**: Generada con `bresenham(20, 20, 180, 120)`  
![image](https://github.com/user-attachments/assets/6f68c079-257d-4c22-bcbc-d072a65e3bf2)
- **Círculo**: Generado con `midpoint_circle(100, 100, 40)`  
 ![image](https://github.com/user-attachments/assets/f7869696-6df3-4d5a-a124-38a549311f6d)
- **Triángulo**: Generado con `fill_triangle((30, 50), (100, 150), (160, 60))`  
![image](https://github.com/user-attachments/assets/c1e7642b-663f-4d78-941e-450f72193e7b)



## Código Relevante
El código completo está en `python/rasterizacion_algoritmos.ipynb`. Los algoritmos clave son:
- **Bresenham**: Usa un error acumulado para decidir qué píxeles dibujar, minimizando operaciones.
- **Punto Medio**: Dibuja círculos calculando puntos en un octante y replicándolos simétricamente.
- **Scanline**: Ordena vértices, interpola bordes y rellena píxeles entre ellos.

## Reflexión
- **Diferencias**:
  - **Bresenham** es eficiente para líneas rectas, ya que solo usa operaciones enteras.
  - **Punto Medio** es ideal para círculos, aprovechando simetría para reducir cálculos.
  - **Scanline** es más complejo, ya que requiere ordenar vértices e interpolar, pero es efectivo para rellenar polígonos.
- **Velocidad**:
  - Bresenham y Punto Medio son más rápidos por su simplicidad y uso de operaciones enteras.
  - Scanline es más lento debido a la interpolación y el bucle de relleno.
- **Precisión**:
  - Todos son precisos para rasterización, pero Scanline puede tener problemas con triángulos muy pequeños o mal alineados debido a la interpolación.

## Instrucciones
1. Clona el repositorio.
2. Abre `python/rasterizacion_algoritmos.ipynb` en Jupyter o Colab.
3. Ejecuta las celdas para generar las imágenes en `resultados/`.
