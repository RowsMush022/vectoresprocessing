PVector centro;
PVector derecha;
PVector punto;

void setup(){
  size(600,430);
  centro = new PVector(width/2, height/2); 
  derecha = new PVector(1,0); 
  punto = new PVector(random(width), random(height));
}

void draw(){
  background(255);
  
  fill(0);
  ellipse(centro.x, centro.y, 10, 10);
  
  PVector derechaCopiada =derecha.copy();
  vector(centro, derechaCopiada.mult(200), color(255,0,0));
  
  PVector puntoVector = PVector.sub(punto, centro);
  vector (centro, puntoVector, color(9, 0, 255));
  
  fill(0, 0, 255);
  ellipse(punto.x, punto.y, 10, 10);
  
}

void vector(PVector origen, PVector vector, color col){
  stroke(col);
  strokeWeight(2);
  line (origen.x, origen.y, origen.x + vector.x, origen.y - vector.y);
}
