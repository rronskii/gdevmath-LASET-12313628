color yellow = color(255, 255, 0);
color purple = color(128, 0, 128);
color blue = color(0, 0, 255);
int strokeWeight = 5;
float frequency = 0.1;
int amplitude = 25;

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, (-height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void drawCartesianPlane()
{
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  
  line(300, 0, -300, 0);
  line (0, 300, 0, -300);
  
  for (int i = -300; i <= 300; i += 10)
  {
    line(i, 2, i, -2);
  }
  
    for (int i = -300; i <= 300; i += 10)
  {
    line(2, i, -2, i);
  }
}



void drawFunctionOne()
{
  // f(x) = x^2 + 15x - 3
  fill(yellow);
  noStroke();
  
  for (float x = -300; x <= 300; x+=0.1f)
  {
    circle(x, ((float)Math.pow(x, 2) - (x * 15)) - 3, strokeWeight);
  }
}

void drawFunctionTwo()
{
  // f(x) = -5x + 30
  fill(purple);
  noStroke();
  
  for (float x = -200; x <= 200; x += 0.1)
  {
    circle(x, (x * -5 + 30), strokeWeight);
  }
}

void drawFunctionThree()
{
  // f(x) = amplitutde * sin(frequency * x + time)
  fill(blue);
  noStroke();

  for (float x = -300; x <= 300; x += 0.1)
  {
    circle(x, (float)Math.sin(x * frequency + frameCount) * amplitude, strokeWeight);
  }
}

void drawCircle()
{
  fill(blue);
  noStroke();
  float radius = 50;
  
  for (float x = 0; x <= 360; x += 0.1)
  {
    circle((float)Math.cos(x) * radius, (float)Math.sin(x) * radius, strokeWeight);
  }
}

void draw()
{
  background(0);
  
  drawCartesianPlane();
  drawFunctionOne();
  drawFunctionTwo();
  drawFunctionThree();
}
