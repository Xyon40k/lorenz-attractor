public class ParticleLine { //TODO: add gradient color and infinite line
  private PVector pos;
  private Trail<PVector> trail;
  private color c = #A0FFA0;
  
  private float sigma = 10;
  private float rho = 28;
  private float beta = 8.0/3.0;
  
  public ParticleLine(int len, float x, float y, float z) {
    this.pos = new PVector(x,y,z);
    trail = new Trail<PVector>(len);
  }

  public ParticleLine(int len, PVector pos) {
    this.pos = pos.copy();
    trail = new Trail<PVector>(len);
  }

  void update(float t) {
    trail.add(pos.copy());
    PVector d = new PVector(sigma*(pos.y - pos.x), pos.x*(rho - pos.z) - pos.y, pos.x*pos.y - beta*pos.z);
    d.mult(t);
    pos.add(d);
  }

  void display2() {
    display2(1);
  }

  void display2(float zoom) {
    stroke(c);
    PVector k = pos;
    for(Object v : trail) {
      PVector a = (PVector)v;
      line(k.x*zoom, k.y*zoom, a.x*zoom, a.y*zoom);
      k = a;
    }  
  }
  
  void display3() {
    display3(1);
  }

  void display3(float zoom) {
    stroke(c);
    PVector k = pos;
    for(Object v : trail) {
      PVector a = (PVector)v;
      line(k.x*zoom, k.y*zoom, k.z*zoom, a.x*zoom, a.y*zoom, a.z*zoom);
      k = a;
    }  
  }
}
