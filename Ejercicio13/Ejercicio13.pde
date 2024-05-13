PVector fuenteLuz;
PVector normalSuperficie;

void setup() {
  size(400, 400);
  fuenteLuz = new PVector(100, 200); // Posición de la fuente de luz
  normalSuperficie = new PVector(1, -1); // Vector normal a la superficie de reflexión
  normalSuperficie.normalize(); // Normalizamos el vector normal
}

void draw() {
  background(255);
  
  // Dibujar la fuente de luz
  fill(255, 255, 0);
  ellipse(fuenteLuz.x, fuenteLuz.y, 10, 10);
  
  // Dibujar la superficie de reflexión
  stroke(0);
  line(200, 400, 300, 200);
  
  // Calcular el vector de dirección del rayo de luz incidente
  PVector rayoIncidente = new PVector(mouseX - fuenteLuz.x, mouseY - fuenteLuz.y);
  rayoIncidente.normalize(); // Normalizamos el vector de dirección
  
  // Calcular el vector de dirección del rayo reflejado usando la fórmula de reflexión especular
  float productoPunto = PVector.dot(rayoIncidente, normalSuperficie);
  PVector rayoReflejado = PVector.sub(rayoIncidente, PVector.mult(normalSuperficie, 2 * productoPunto));
  
  // Dibujar el rayo incidente
  stroke(255, 0, 0);
  line(fuenteLuz.x, fuenteLuz.y, mouseX, mouseY);
  
  // Dibujar el rayo reflejado
  stroke(0, 0, 255);
  line(fuenteLuz.x, fuenteLuz.y, fuenteLuz.x + rayoReflejado.x * 100, fuenteLuz.y + rayoReflejado.y * 100);
}
