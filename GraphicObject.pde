abstract class GraphicObject
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector friction;
  float mass = 1;
  
  color fillColor = color (255);
  color strokeColor = color (255);
  float strokeWeight = 1;
  
  void setLocation(float x, float y) 
  {
    location.x = x;
    location.y = y;
  }
  
  void setVelocity(float x, float y) 
  {
    velocity.x = x;
    velocity.y = y;
  }
  
  abstract void update();
  
  abstract void display();
  
  void applyForce (PVector force) 
  {
    PVector f = PVector.div (force, mass);
   
    this.acceleration.add(f);
  }
}
