import java.util.ArrayList; // Importar ArrayList
import processing.core.PApplet; // Importar PApplet
import processing.core.PVector; // Importar PVector

ArrayList<Proyectil> proyectiles = new ArrayList<Proyectil>();
Tanque tanqueAzul, tanqueRojo;
boolean puedeDisparar = true;

void setup() {
  size(600, 400);
  tanqueAzul = new Tanque(random(width), random(height), color(0, 0, 255)); // Color azul
  tanqueRojo = new Tanque(random(width), random(height), color(255, 0, 0)); // Color rojo
}

void draw() {
  background(220);
  tanqueAzul.actualizar(tanqueRojo);
  tanqueRojo.actualizar(null); // No necesita apuntar al otro tanque
  tanqueAzul.mostrar();
  tanqueRojo.mostrar();
  
  // Actualizar y mostrar proyectiles
  for (int i = proyectiles.size()-1; i >= 0; i--) {
    Proyectil p = proyectiles.get(i);
    p.actualizar();
    p.mostrar();
    
    // Comprobar colisión con tanqueRojo
    if (tanqueRojo.esGolpeado(p)) {
      tanqueRojo.destruir();
      proyectiles.remove(i);
    } else if (p.estaFueraDePantalla()) {
      proyectiles.remove(i);
    }
  }
  
  // Comprobar si el tanque rojo está dentro del rango del tanque azul usando el teorema de Pitágoras
  float distancia = dist(tanqueAzul.x, tanqueAzul.y, tanqueRojo.x, tanqueRojo.y);
  if (distancia < 100 && puedeDisparar) { // Ajusta el rango según sea necesario
    tanqueAzul.disparar();
    puedeDisparar = false;
  } else if (distancia >= 100) {
    puedeDisparar = true; // Restablecer la capacidad de disparar cuando el tanque rojo está fuera de rango
  }
}
