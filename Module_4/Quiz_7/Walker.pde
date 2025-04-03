public class Walker {

  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 10;
  public float scale = 15;
  
  public Walker()
  {
    
  }
  
  public void update()
  {
    // Calculate direction to mouse
    PVector mouse = new PVector(mouseX - Window.windowWidth, -(mouseY - Window.windowHeight));
    PVector direction = PVector.sub(mouse, this.position);
    direction.normalize().mult(0.2);
    
    this.acceleration = direction;
    
    // Physics
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
  }
  
  public void render()
  {
    noStroke();
    circle(position.x, position.y, scale);
  }
  /*
  public void checkEdges()
  {
    if (this.position.x > Window.right)
    {
      this.position.x = Window.left;
    }
    else if (this.position.x < Window.left)
    {
      this.position.x = Window.right;
    }
    
    if (this.position.y > Window.top)
    {
      this.position.y = Window.bottom;
    }
    else if (this.position.y < Window.bottom)
    {
      this.position.y = Window.top;
    }
  }
  */
}
