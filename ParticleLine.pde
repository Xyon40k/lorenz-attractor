public class ParticleLine { //TODO: infinite line
  private PVector pos;
  private Trail<PVector> trail;
  
  private color cfirst = #FF1010;
  private color clast = #A0FFA0;
  private color chead = #FF1010;
  
  private boolean showhead = false;
  
  // Standard values are p=28, o=10, b=8/3
  private float rho = 28;
  private float sigma = 10;
  private float beta = 8.0/3.0;
  
  public ParticleLine(int len, float x, float y, float z) {
    this.pos = new PVector(x,y,z);
    trail = new Trail<PVector>(len);
  }

  public ParticleLine(int len, PVector pos) {
    this.pos = pos.copy();
    trail = new Trail<PVector>(len);
  }

  public void update(float t) {
    trail.add(pos.copy());
    PVector d = new PVector(sigma*(pos.y - pos.x), pos.x*(rho - pos.z) - pos.y, pos.x*pos.y - beta*pos.z);
    d.mult(t);
    pos.add(d);
  }

  public void display2() {
    display2(1);
  }

  public void display2(float zoom) {
    strokeWeight(1);
    int i = 0;
    PVector k = pos;
    for(Object v : trail) {
      stroke(getGradient(i));
      PVector a = (PVector)v;
      line(k.x*zoom, k.y*zoom, a.x*zoom, a.y*zoom);
      k = a;
      i++;
    }
    
    if(showhead) {
      strokeWeight(6);
      stroke(chead);
      point(pos.x*zoom, pos.y*zoom, pos.z*zoom);
    }
  }
  
  public void display3() {
    display3(1);
  }

  public void display3(float zoom) {
    strokeWeight(1);
    int i = 0;
    PVector k = pos;
    for(Object v : trail) {
      stroke(getGradient(i));
      PVector a = (PVector)v;
      line(k.x*zoom, k.y*zoom, k.z*zoom, a.x*zoom, a.y*zoom, a.z*zoom);
      k = a;
      i++;
    }
    
    if(showhead) {
      strokeWeight(6);
      stroke(chead);
      point(pos.x*zoom, pos.y*zoom, pos.z*zoom);
    }
  }
  
  public color getGradient(int i) {
    int r1 = (cfirst >> 16) & 0xFF;
    int g1 = (cfirst >> 8) & 0xFF;
    int b1 = cfirst & 0xFF;
    
    int r2 = (clast >> 16) & 0xFF;
    int g2 = (clast >> 8) & 0xFF;
    int b2 = clast & 0xFF;
    
    float t = i*(1.0/(trail.getCapacity()-1));
    
    color res = color(r1+t*(r2-r1), g1+t*(g2-g1), b1+t*(b2-b1));
    return res;
  }
}
