class Balloon extends Ball
{
  Balloon()
  {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    size = new PVector(50, 50);
    
    mass = 1;
    
    fillColor = color (255, 0, 0, 130);
    strokeColor = color (0);
  }
  
  void update()
  {
    checkEdges();
    
    velocity.add(acceleration);
    location.add(velocity);
    
    acceleration.mult (0);
  }
  
  void display()
  {
    // Balloon
    stroke(strokeColor);
    fill(fillColor);
    circle(location.x, location.y, size.x);
    stroke(0);
    line(location.x, location.y+size.x/2, location.x, location.y+100);
  }
}
