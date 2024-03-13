float da = 0.01;

float ax = 0;
float ay = 0;
float az = 0;

float dd = 3;

float dx = 400;
float dy = 400;

float at = 0.0001;
float dt = 0.01;

float zoom = 5;

ParticleLine p;

void setup() {
  size(800, 800, P3D);
  background(0);
  p = new ParticleLine(1000, 1, 1, 0);
}

float mod2pi(float n) {
  if(n > TAU) {
    return n-TAU;
  } else if(n < 0) {
    return n+TAU;
  }
  return n; 
}

void draw() {
  background(0);
  translate(dx, dy);
  rotateX(ax);
  rotateY(ay);
  rotateZ(az);
  
  p.update(dt);
  p.display3(zoom);
  
  
  if(keyPressed) {
    if(key == CODED) {
      switch(keyCode) {
        case UP:
          dy += dd;
          break;
          
        case DOWN:
          dy -= dd;
          break;
        
        case RIGHT:
          dx -= dd;
          break;
        
        case LEFT:
          dx += dd;
          break;
      }
    } else {
      switch(key) {
        case 'a':
          ay = mod2pi(ay+da);
          break;
          
        case 'd':
          ay = mod2pi(ay-da);
          break;
          
        case 'w':
          ax = mod2pi(ax-da);
          break;
          
        case 's':
          ax = mod2pi(ax+da);
          break;
        
        case 'q':
          az = mod2pi(az-da);
          break;
          
        case 'e':
          az = mod2pi(az+da);
          break;
          
        case '+':
          zoom += zoom*0.01;
          break;
          
        case '-':
          zoom -= zoom*0.01;
          break;
          
        case 'o':
          dt -= at;
          break;
          
        case 'p':
          dt += at;
          break;
      }
    }
  }
}
