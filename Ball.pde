class Ball extends GraphicObject
{  
  PVector size; 
  float topSpeed;
  float mass;
  
  Ball () 
  {
    
    location = new PVector (random (width), random(height));
    velocity = new PVector (0, 0);
    acceleration = new PVector (0 , 0);
    size = new PVector (16, 16);
    
    mass = 1;
  }  
  
  Ball (PVector l, PVector v) 
  {
    location = l;
    velocity = v;
    acceleration = new PVector (0 , 0);
    size = new PVector (16, 16);
    topSpeed = 100;
  }
  
  Ball (float m, float x, float y) 
  {
    mass = m;
    location = new PVector (x, y);
    
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    size = new PVector (16, 16);
  }
  
  void update () 
  {
    velocity.add (acceleration);
    location.add (velocity);

    acceleration.mult (0);
  }
  
  void display () 
  {
    stroke (0);
    fill (127, 127, 127, 127);
    
    ellipse (location.x, location.y, mass * size.x, mass * size.y); // Dimension à l'échelle de la masse
  }
  
  void checkEdges() 
  {
    if (location.x + size.x/2*mass > width) 
    {
      location.x = width - size.x/2*mass;
      velocity.x *= -1;
    } 
    else if (location.x - size.x/2*mass < 0) 
    {
      velocity.x *= -1;
      location.x = 0 + size.x/2*mass;
    }
    
    if (location.y + size.y/2*mass > height) 
    {
      velocity.y *= -.9;
      location.y = height - size.y/2*mass;
    }
    
    if (location.y - size.y/2*mass < 1) 
    {
      velocity.y *= -.6;
      location.y = 1 + size.y/2*mass;
    }
  }
  
  
  void applyForce (PVector force) 
  {
    PVector f = PVector.div (force, mass);
   
    acceleration.add(f);
  }
  
  Rectangle getRectangle() 
  {
    Rectangle r = new Rectangle(location.x, location.y, size.x, size.y);
    
    return r;
  }
}
