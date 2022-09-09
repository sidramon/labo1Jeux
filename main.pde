Ball[] balls;
Fluid fluid;
Balloon balloon;
int time = 0;
int lastTime;

boolean fluidOn = false;

PVector helium = new PVector (0, -0.96);

void setup () 
{
  lastTime = millis()/1000;
  time = millis()/1000;
  
  size (1080, 720);
  balls = new Ball[50];
  
  fluid = new Fluid();
  fluidOn = false;
  
  balloon = new Balloon();
  
  stroke (0);
  fill (175);
  
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball();
    balls[i].mass = abs(int(randomGaussian()*4));
    balls[i].location.x = 30 + i * (width / 50);
    balls[i].location.y = balls[i].size.y+100;
  }
}

float xOff = 0.0;
float n;

void update() 
{
  time = millis()/1000;
  
  balloon.update();
  balloon.applyForce(helium);
  PVector bFriction = balloon.velocity.copy();
  bFriction.mult(-1);
  bFriction.normalize();
  bFriction.mult(0.01);
  balloon.applyForce(bFriction);
  
  
  for (int i = 0; i < balls.length; i++) {
    
    float m = balls[i].mass;
    
    PVector gravity = new PVector (0, 0.1 * m);
    
    PVector friction = balls[i].velocity.copy();
    
    if(mousePressed)
    {
      PVector wind = new PVector (.1, 0);
      if(mouseX > width/2)
      {
        wind.x*=-1;
      }
      balls[i].applyForce(wind);
    }
    
    friction.mult(-1);
    friction.normalize();
    friction.mult(0.01);
    
    if (fluidOn && fluid.getRectangle().intersect(balls[i].getRectangle())) {   
      PVector fluid_density = fluid.draggingForce(balls[i].velocity, balls[i].mass);
      balls[i].applyForce(fluid_density);
    }
    
    balls[i].applyForce(gravity);
    balls[i].applyForce(friction);
    balls[i].update();
    balls[i].checkEdges();
  }  
}

void mousePressed()
{
  PVector wind = new PVector (.1, 0);
  if(mouseX > width/2)
  {
    wind.x*=-1;
  }
  balloon.applyForce(wind);
}

void keyPressed() 
{
  if (keyCode == 82) 
  {
    for (int i = 0; i < balls.length; i++) 
    {
      setup();
    }
  }
  
  if (keyCode == 32) 
  {
    fluidOn = !fluidOn;
    fluid = new Fluid();
  }
}


void render () 
{
  background (255);
  
  fill(0);
  textSize(20);
  text(time-lastTime + " seconds", 1080-1080*0.92, 720-720*0.92);
  
  if(fluidOn)
    fluid.display();
  
  balloon.display();
  
  fill(100, 200, 100);

  for (int i = 0; i < balls.length; i++) {
    balls[i].display();
  }
}



void draw () 
{
  update();
  render();
    
}
