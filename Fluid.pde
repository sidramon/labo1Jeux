class Fluid
{
  Rectangle r;
  float _height = random(0.1 * height, 0.4 * height);
  float density = random(1.5, 3);
  color _color = color(0, 90, 250, density*15);
  float coefficientFriction;
  
  Fluid () {
    r = new Rectangle(0, height - _height, width, _height);
    coefficientFriction = 0.1;
  }
  
  Fluid (Rectangle _r, float _density, float _coefficientFriction) {
    r = _r;
    density = _density;
    coefficientFriction = _coefficientFriction;
  }
  
  Rectangle getRectangle () {
    return r;
  }
  
  void display () {
        // Water //
    fill(_color);
    stroke(_color);
    rect(0, height-_height, width, _height);
    
    
    // Text //
    int ts = 18;
    
    fill(0);
    textAlign(CENTER);
    textSize(ts);
    text(density, width/2, height-_height/2);
    text("Simon Aucoin", width/2, height-_height/2+ts);
  }
  
  PVector draggingForce(PVector speed, float area) {
    float speedMag = speed.mag();
    float coeffRhoMag = density * coefficientFriction * speedMag * speedMag * 0.5;
    
    PVector result = speed.copy();
    result.mult(-1);
    result.normalize();
    result.mult(area);
    result.mult(coeffRhoMag);
   
    return result;
  }
}
