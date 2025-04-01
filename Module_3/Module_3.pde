void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, (-height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(0);
}

void paintSplatter()
{
  // x-coordinate gaussian
  float xGaussian = randomGaussian();
  
  float xStdDev = 200;
  float xMean = 0;
  float x = xStdDev * xGaussian + xMean;
  
  // strokeWeight gaussian
  float weightGaussian = randomGaussian();
  float weightStdDev = 15;
  float weightMean = 50;
  float strokeWeight = weightStdDev * weightGaussian + weightMean;
  
  float y = random(-height, height);
  
  noStroke();
  fill(random(255), random(255), random(255), random(10, 100));
  circle(x, y, strokeWeight);
}

void draw()
{
  paintSplatter();
  
  frameCount++;
  if (frameCount >= 300)
  {
    background(0);
    frameCount = 0;
  }
}
