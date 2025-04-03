Walker[] walker = new Walker[100];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  generateWalkers();
}

void generateWalkers()
{
  for (int i = 0; i < walker.length; i++)
  {
    walker[i] = createWalker();
  }
}

Walker createWalker()
{
  Walker w = new Walker();
  
  // Gaussian x and y
  float xGaussian = randomGaussian();
  float xStdDev = Window.windowWidth / 2;
  float xMean = 0;
  float yGaussian = randomGaussian();
  float yStdDev = Window.windowHeight / 2;
  float yMean = 0;
  
  w.position.x = xStdDev * xGaussian + xMean;
  w.position.y = yStdDev * yGaussian + yMean;

  // Random size
  w.scale = random(5, 20);

  return w;
}

void draw()
{
  background(80);
  
  for (Walker w : walker)
  {
    w.update();
    w.render();
  }
}
