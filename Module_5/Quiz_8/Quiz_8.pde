Walker[] walkers = new Walker[10];
PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker(i + 1); // Assign mass
  }
}

void draw()
{
  background(80);
  
  for (Walker w : walkers)
  {
    w.applyForce(wind);
    w.applyForce(gravity);
    
    w.update();
    w.render();
    w.checkEdges();
  }
}
