float G = 0.01;
int N = 9;
Object[] Planets = new Object[N];
Force[] Gravities = new Force[N*(N-1)/2];

PVector[] centers = new PVector[N];
float[] R = {100, 2, 3, 3, 2, 10, 8, 4, 4 };
float[] M = {100000, 5, 10, 10, 7, 100, 60, 30, 30};

void init(){
     for (int i=0; i<N; i++){         
         centers[i] = new PVector((1-i*0.1)*width/2, (1-i*0.1)*height/2);
     }
     for (int i=0; i<N; i++){       
         Planets[i] = new Object(R[i], M[i], centers[i].x, centers[i].y, true);
     }
     int n=0;
     for (int i=0; i<N; i++){
         for (int j=0; j<i+1; j++){
            if (i!=j){
             Gravities[n] = new Force(Planets[i], Planets[j], G);
             n++;
            }
         }
     }
      
}
    
boolean inPlanet(float x, float y, float cx, float cy, float r){
        if(sqrt((x-cx)*(x-cx)+(y-cy)*(y-cy)) < r){
        return true;
        }else{
        return false;
        }
}
    
void setup(){
    size(1280, 720);
    frameRate(30);  
    background(0);
    init();
  }

void draw(){
     fill(0, 20);
     rect(0, 0, width, height);
     
     for (int i=N-1; i>-1; i--){
    
         //if (inPlanet(Planets[i].r[2].x, Planets[i].r[2].y, width/2, height/2, R[0]*0.55)==false){
           Planets[i].display();
         //}
     }
     //Planets[0].display();
     
    // for (int s=0; s<4; s++){ // speed up
         int n=0;
         for (int i=0; i<N; i++){
            for (int j=0; j<i+1; j++){
                if (i!=j){
                Gravities[n].TimeUpdate();
                Gravities[n].Return(Planets[i], Planets[j]);
                n++;
                }
            }
         }       
     //}
     if (mousePressed == true){
       for (int i=0; i<N; i++){
         for (int j=0; j<i+1; j++){
            if (i!=j){
             Planets[i].reset();
             Planets[j].reset();
            }
         }
     }
 
   }
   Planets[0].reset();
     //saveFrame("frames/######.png");
   
}
