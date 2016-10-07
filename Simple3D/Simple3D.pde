void setup() {
  size(600, 300, P3D); 
}

void draw() {
  background(100);
  lights();
  stroke(10);

  float rotationX = map(mouseX,0,width,0,2*PI);
  float rotationY = map(mouseY,0,height,0,2*PI);

  // Draw a rotated box
  fill(150,40,40);
  pushMatrix();
  translate(200, height/2, 0);
  rotateY(rotationX);
  rotateX(rotationY);
  box(130);
  popMatrix();

  // Draw a rotated sphere
  fill(40,150,40);
  pushMatrix();
  translate(500, height/2, -200);
  rotateY(-rotationX);
  rotateX(-rotationY);
  sphere(150);
  popMatrix();
}