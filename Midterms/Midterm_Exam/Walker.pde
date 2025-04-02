public class Walker {

  public PVector position = new PVector();
  public float scale = 50;
  public color randomColor = color(random(255), random(255), random(255), random(75, 150));
  
  public Walker(){}
  
  public void renderBlackHole()
  {
    noStroke();
    fill(255);
    circle(position.x, position.y, scale);
  }
  
  public void renderMatter()
  {
    noStroke();
    fill(randomColor);
    circle(position.x, position.y, scale);
  }
}
