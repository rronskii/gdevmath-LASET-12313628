Liquid ocean = new Liquid(0, -100, Window.right, Window.left, 0.1f);
PVector wind = new PVector(0.1, 0);
Walker[] walkers = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  generateWalkers(); // Initialize walkers
}

void generateWalkers()
{
  for (int i = 0; i < walkers.length; i++)
  {
    float spacing = 2 * (Window.windowWidth / walkers.length);
    float posX = spacing * (i - (walkers.length / 2));
    float posY = Window.top;
    walkers[i] = new Walker((walkers.length * 1.2 - i), posX, posY);
  }
}

// Reset all walkers on mouse click
void mousePressed()
{
  generateWalkers();
}

void draw()
{
  background(255);
  
  ocean.render();
  
  for (Walker w : walkers)
  {
    PVector gravity = new PVector(0, -0.15f * w.mass);
    
    float c = 0.1f;
    float normal = 1f;
    float frictionMagnitude = c * normal;
    PVector friction = w.velocity.copy();
    
    w.render();
    w.update();
    w.checkEdges();
    w.applyForce(gravity);
    w.applyForce(wind);
    w.applyForce(friction.mult(-1).normalize().mult(frictionMagnitude));
    
    if (ocean.isCollidingWith(w))
  {
    PVector dragForce = ocean.calculateDragForce(w);
    w.applyForce(dragForce);
  }
  }
}
