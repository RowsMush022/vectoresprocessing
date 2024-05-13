class Proyectil {
  float x, y;
  float velocidad = 5;
  float angulo;
  
  Proyectil(float x, float y, float angulo) {
    this.x = x;
    this.y = y;
    this.angulo = angulo;
  }
  
  void actualizar() {
    x += cos(angulo) * velocidad;
    y += sin(angulo) * velocidad;
  }
  
  void mostrar() {
    fill(0, 255, 0); // Color verde
    ellipse(x, y, 10, 10); // Cambia el tamaño del proyectil según sea necesario
  }
  
  boolean estaFueraDePantalla() {
    return (x < 0 || x > width || y < 0 || y > height);
  }
}
