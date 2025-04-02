public class Walker {

  public PVector position = new PVector();
  public float scale = 50;
  public color walkerColor;
  
    public Walker()
  {
    walkerColor = color(random(255), random(255), random(255), random(75, 150));
  }
  
  public void renderBlackHole()
  {
    noStroke();
    fill(255);
    circle(position.x, position.y, scale);
  }
  
  public void renderMatter()
  {
    noStroke();
    fill(walkerColor);
    circle(position.x, position.y, scale);
  }
}
