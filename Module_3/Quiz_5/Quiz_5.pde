void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector position = new PVector();
PVector speed = new PVector(5, 8);

Walker perlinWalker = new Walker(-100, 0);
Walker moveAndBounceWalker = new Walker(100, 0);

void draw()
{
  // Background flush
  background(255);
  
  // Walker movement
  perlinWalker.perlinWalk();
  moveAndBounceWalker.moveAndBounce();
  
  // Render walkers
  perlinWalker.render();
  moveAndBounceWalker.render();
}
