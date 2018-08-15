class Object{
    float mass;
    float radius;
    PVector[] r; 
    PVector v;
    color c;
    int alpha = 255;
    boolean INIT = true;
    
    float cx, cy;

    Object(float R, float M, float x, float y, boolean t){
        r = new PVector[3];
        cx = x;
        cy = y;
        r[2] = new PVector(x, y);
        radius = R;
        mass = M;
        c = #FFFFFF;
        INIT = t;
        init();
    }
    
    void init(){
        if (INIT){
        r[1] = new PVector(r[2].x, r[2].y-1);
        r[0] = new PVector(r[2].x, r[2].y-2);
        }else{
        r[1] = new PVector(r[2].x, r[2].y+1);
        r[0] = new PVector(r[2].x, r[2].y+2);
        }
      }  
    void Fill(color C, int A){
         c = C;
         alpha = A;
    }

    void update(float M, float R){
         mass = M;
         radius = R;
    }
    void step(){
        r[0] = r[1].copy();
        r[1] = r[2].copy();      
    }
    
    void display(){
       fill(c, alpha);
       ellipse(r[2].x, r[2].y, radius, radius);
       noFill();
    }
    void reset(){
       r[2] = new PVector(cx, cy);
       init();
    }  
    
  
}
