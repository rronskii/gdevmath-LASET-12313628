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
    // Gaussian x and y
    float x = randomGaussian() * (Window.windowWidth / 4);
    float y = randomGaussian() * (Window.windowHeight / 4);
    
    // Random mass between 1 and 5 (adjust as needed)
    float mass = random(5, 15);
    
    walkers[i] = new Walker(mass, x, y);
  }
}


void mousePressed()
{
  generateWalkers();
}

void draw()
{
  background(0);
  
  for (int i = 0; i < walkers.length; i++)
  {
    for (int j = 0; j < walkers.length; j++)
    {
      if (i != j)
      {
        PVector force = walkers[j].calculateAttraction(walkers[i]);
        walkers[i].applyForce(force);
      }
    }
  }

  for (Walker w : walkers)
  {
    w.update();
    w.render();
  }
}
