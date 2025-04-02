class Walker
{
  // Vector for walker
  public PVector position = new PVector();
  public PVector speed = new PVector(5, 8);
  
  public float tx = 0, ty = 100000;
  public float strokeWeight;
  public float tStrokeWeight = 10;
  public float r, g, b;
  public float tr = 100, tg = 1000, tb = 10000;
  
  Walker(float startX, float startY)
  {
    position.x = startX;
    position.y = startY;
  }

  void render()
  {
    // rgb perlin
    r = map(noise(tr), 0, 1, 0, 255);
    g = map(noise(tg), 0, 1, 0, 255);
    b = map(noise(tb), 0, 1, 0, 255);
    
    // strokeWeight perlin
    strokeWeight = map(noise(tStrokeWeight), 0, 1, 5, 150);
    
    fill(random(r), random(g), random(b), 255);
    noStroke();
    circle(position.x, position.y, strokeWeight);
    
    tr += 0.01;
    tg += 0.01;
    tb += 0.01;
    tStrokeWeight += 0.01;
  }

  void perlinWalk()
  {
    position.x = map(noise(tx), 0, 1, -640, 640);
    position.y = map(noise(ty), 0, 1, -360, 360);
    
    tx += 0.01f;
    ty += 0.01f;
  }
  
  void moveAndBounce()
  {
    // Move
    position.add(speed);

    // condition for bouncing
    if (position.x > Window.right || position.x < Window.left)
    {
      speed.x *= -1;
    }
    
    if (position.y > Window.top || position.y < Window.bottom)
    {
      speed.y *= -1;
    }
  }
}
