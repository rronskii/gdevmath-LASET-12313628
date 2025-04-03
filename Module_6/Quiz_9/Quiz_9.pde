Walker[] walkers = new Walker[8];
PVector acceleration = new PVector(0.2, 0); // Acceleration force

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  generateWalkers(); // Initialize walkers
}

// Generate walkers
void generateWalkers()
{
  for (int i = 0; i < walkers.length; i++)
  {
    float posY = 2 * (Window.windowHeight / walkers.length) * (i - (walkers.length / 2)) + 50;
    walkers[i] = new Walker(walkers.length - i, Window.left, posY);
  }
}

// Reset all walkers on mouse click
void mousePressed()
{
  generateWalkers();
}

void draw()
{
  background(80);
  
  // Friction line
  stroke(0);
  strokeWeight(2);
  line(0, Window.bottom, 0, Window.top);
  
  for (Walker w : walkers)
  {
    // Determine friction coefficient based on position
    float mew = (w.position.x > 0) ? 0.4f : 0.01f;
    float normal = 1;
    float frictionMagnitude = mew * normal;

    // Apply friction
    PVector friction = w.velocity.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    w.applyForce(friction);
    
    // Apply acceleration
    PVector acc = PVector.div(acceleration, w.mass); // Bonus: Apply mass
    w.applyForce(acc);
    
    w.update();
    w.render();
    w.checkEdges();
  }
}
