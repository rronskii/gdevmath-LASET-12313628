Walker blackHole = new Walker();
Walker[] matter = new Walker[200];
int t = 0;

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // Generate black ho
  blackHole.position.x = 0;
  blackHole.position.y = 0;
  blackHole.renderBlackHole();

  blackHolePosition();
  generateMatter();
}

// Initialize
void generateMatter()
{
  for (int i = 0; i < matter.length; i++)
  {
    matter[i] = matter();
  }
}

void blackHolePosition()
{
  blackHole.position.x = random(-Window.windowWidth, Window.windowWidth);
  blackHole.position.y = random(-Window.windowHeight, Window.windowHeight);
}

// Matter constructor
Walker matter()
{
  Walker matter = new Walker();
  
  // Gaussian x and y
  float xGaussian = randomGaussian();
  float xStdDev = Window.windowWidth / 2;
  float xMean = 0;
  float yGaussian = randomGaussian();
  float yStdDev = Window.windowHeight / 2;
  float yMean = 0;
  
  
  matter.position.x = xStdDev * xGaussian + xMean;
  matter.position.y = yStdDev * yGaussian + yMean;

  // Random size
  matter.scale = random(5, 20);

  return matter;
}

void draw()
{
  // Black background
  background(0);
  
  // Matter generator
  for (Walker matter : matter)
  {
    PVector direction = PVector.sub(blackHole.position, matter.position);
    direction.normalize().mult(7); // matter speed
    
    matter.position.add(direction);
    
    matter.renderMatter();
  }
  
  // Render black hole
  blackHole.renderBlackHole();
  
  t++;

  if (t >= 100)
  {
    blackHolePosition();
    generateMatter();
    t = 0;
  }

}
