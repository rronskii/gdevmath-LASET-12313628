class Walker
{
  float x;
  float y;
  
    Walker(float startX, float startY) {
    x = startX;
    y = startY;
  }
  
  void render()
  {
    fill(random(255), random(255), random(255), random(50, 100));
    noStroke();
    circle(x, y, 30);
  }
  
  void randomWalk()
  {
    int rng = int(random(8)); // 8 possible directions
    if (rng == 0) y += 10;  // Up
    else if (rng == 1) y -= 10;  // Down
    else if (rng == 2) x += 10;  // Right
    else if (rng == 3) x -= 10;  // Left
    else if (rng == 4) { x += 10; y += 10; } // Top-right
    else if (rng == 5) { x -= 10; y += 10; } // Top-left
    else if (rng == 6) { x += 10; y -= 10; } // Bottom-right
    else if (rng == 7) { x -= 10; y -= 10; } // Bottom-left
  }
  
  void randomWalkBiased()
  {
    float rng = random(1); // Random value between 0-1
    
    if (rng < 0.4) x += 10;  // 40% chance to move right
    else if (rng < 0.55) x -= 10;  // 15% chance to move left
    else if (rng < 0.9) y += 10;  // 35% chance to move up
    else y -= 10;  // 10% chance to move down
  }
}
