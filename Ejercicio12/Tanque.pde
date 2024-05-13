class Tanque {
  float x, y;
  float velocidad = 1;
  float angulo;
  color colorTanque;
  boolean destruido = false;
  
  Tanque(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.colorTanque = c;
    angulo = random(TWO_PI); // Dirección inicial aleatoria
  }
  
  void actualizar(Tanque objetivo) {
    if (!destruido && objetivo != null) {
      // Calcular vector hacia el objetivo
      PVector posicionObjetivo = new PVector(objetivo.x, objetivo.y);
      PVector direccion = PVector.sub(posicionObjetivo, new PVector(x, y));
      angulo = direccion.heading(); // Establecer ángulo hacia el objetivo
    }
    
    // Mover el tanque
    x += cos(angulo) * velocidad;
    y += sin(angulo) * velocidad;
    
    // Si el tanque alcanza los límites de la pantalla, cambia de dirección
    if (x < 0 || x > width || y < 0 || y > height) {
      angulo += PI; // Girar
    }
    
    // Cambiar de dirección aleatoriamente a veces
    if (random(1) < 0.01) {
      angulo += random(-PI/4, PI/4);
    }
  }
  
  void mostrar() {
    if (!destruido) {
      pushMatrix();
      translate(x, y);
      rotate(angulo);
      // Dibujar tanque (reemplaza esto con tus gráficos de tanque)
      fill(colorTanque);
      rect(-15, -10, 30, 20);
      ellipse(-10, 0, 15, 15);
      popMatrix();
    }
  }
  
  void disparar() {
    proyectiles.add(new Proyectil(x, y, angulo));
  }
  
  boolean esGolpeado(Proyectil p) {
    float d = dist(x, y, p.x, p.y);
    return d < 15; // Ajusta este valor según el tamaño de tu tanque
  }
  
  void destruir() {
    destruido = true;
  }
}
