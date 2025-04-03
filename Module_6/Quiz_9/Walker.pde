public class Walker 
{
  public PVector position;
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public float velocityLimit = 10;
  public float scale;
  public float mass;
  public color walkerColor;

  public Walker(float mass, float x, float y)
  {
    this.mass = mass;
    this.scale = mass * 15;
    this.position = new PVector(x, y); // Position set based on spacing
    this.walkerColor = color(random(255), random(255), random(255));
  }

  // Newton's Second Law of Motion
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }

  public void update()
  {  
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
  }

  public void render()
  {
    noStroke();
    fill(walkerColor);
    circle(position.x, position.y, scale);
  }

  public void checkEdges()
  {
    if (this.position.x > Window.right)
    {
      this.velocity.x *= -1;
    }

    if (this.position.y > Window.top || this.position.y < Window.bottom)
    {
      this.velocity.y *= -1;
    }
  }
}
