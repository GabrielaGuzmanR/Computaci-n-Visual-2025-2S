void setup() {
  size(800, 600, P3D); // 3D canvas
  background(200); // Light gray background
}

void draw() {
  background(200); // Clear frame with light gray
  lights(); // Add basic lighting for 3D effect
  
  // Center the cube in the canvas
  translate(width/2, height/2, 0);
  
  // Wave-like translation using sin()
  float tx = 100 * sin(radians(frameCount)); // Move along X
  float ty = 50 * cos(radians(frameCount)); // Move along Y
  float tz = 50 * sin(radians(frameCount * 2)); // Move along Z
  
  // Cyclic scaling
  float s = 1 + 0.5 * sin(radians(frameCount * 3)); // Scale between 0.5 and 1.5
  
  // Isolate transformations with pushMatrix/popMatrix
  pushMatrix();
  
  // Apply transformations
  translate(tx, ty, tz); // Wave-like motion
  rotateX(radians(frameCount * 2)); // Rotate around X axis
  rotateY(radians(frameCount * 3)); // Rotate around Y axis
  scale(s); // Cyclic scaling
  
  // Draw the cube
  fill(255, 204, 0); // Yellow-orange fill
  stroke(0); // Black outline
  strokeWeight(2);
  box(100); // Cube with side length 100
  
  popMatrix();
}
