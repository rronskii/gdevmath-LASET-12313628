void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth;
  float y = -(mouseY - Window.windowHeight);
  return new PVector(x, y);
}

void draw()
{
  // Background
  background(50);

  PVector mouse = mousePos();
  mouse.normalize().mult(250);
  
  float magnitude = mouse.mag();
  println(magnitude);

  // Outer red glow
  strokeWeight(20);
  stroke(255, 0, 0, 75);
  line(-mouse.x, -mouse.y, mouse.x, mouse.y);

  // Inner white glow
  strokeWeight(10);
  stroke(255, 255, 255, 255); // White core
  line(-mouse.x, -mouse.y, mouse.x, mouse.y);

  // Black handle
  mouse.mult(0.15);
  strokeWeight(25);
  stroke(0);
  line(-mouse.x, -mouse.y, mouse.x, mouse.y);
}
