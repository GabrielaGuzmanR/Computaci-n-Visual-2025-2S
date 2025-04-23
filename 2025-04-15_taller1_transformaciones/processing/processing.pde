void setup() {
  size(800, 600, P3D); // Crea un lienzo 3D de 800x600 píxeles
  background(200); // Fondo inicial gris claro
}

void draw() {
  // Fondo dinámico que cambia suavemente con el tiempo
  float r = 150 + 50 * sin(radians(frameCount)); // R entre 100 y 200
  float g = 150 + 50 * cos(radians(frameCount)); // G entre 100 y 200
  background(r, g, 200); // Fondo dinámico con tonos grises y azulados
  
  lights(); // Iluminación básica para el cubo 3D
  
  // Centrar el cubo en el lienzo
  translate(width/2, height/2, 0);
  
  // Movimiento ondulado usando sin() y cos()
  float tx = 100 * sin(radians(frameCount)); // Traslación en X
  float ty = 50 * cos(radians(frameCount)); // Traslación en Y
  float tz = 50 * sin(radians(frameCount * 2)); // Traslación en Z
  
  // Escalado cíclico entre 0.5 y 1.5
  float s = 1 + 0.5 * sin(radians(frameCount * 2)); // Reduje el factor de 3 a 2
  
  // Aislar transformaciones
  pushMatrix();
  
  // Aplicar transformaciones
  translate(tx, ty, tz); // Movimiento ondulado
  rotateX(radians(frameCount * 1)); // Rotación en X (más lenta)
  rotateY(radians(frameCount * 1.5)); // Rotación en Y (más lenta)
  rotateZ(radians(frameCount * 0.5)); // Rotación en Z (nueva)
  scale(s); // Escalado cíclico
  
  // Dibujar el cubo
  fill(255, 204, 0); // Color amarillo-naranja
  stroke(0); // Contorno negro
  strokeWeight(2); // Grosor del contorno
  box(100); // Cubo de 100 unidades de lado
  
  popMatrix();
}
