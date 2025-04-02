void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

Walker walker1 = new Walker(-100, 0);
Walker walker2 = new Walker(100, 0);

void draw()
{  
  walker1.randomWalk();
  walker2.randomWalkBiased();
  
  walker1.render();
  walker2.render();
}
