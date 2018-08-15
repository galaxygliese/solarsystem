class Force{
   float G = 100;
   
   float R;
   float rr;
   Object obj1;
   Object obj2;   
   
   PVector e12;
   PVector e21;
   
   Force(Object O1, Object O2, float g){
       
       //obj1 = new Object(O1.radius, O1.mass, O1.cx, O1.cy, O1.INIT);
       //obj2 = new Object(O2.radius, O2.mass, O2.cx, O2.cy, O2.INIT);
       obj1 = O1;
       obj2 = O2;
       
       G = g;
       R = obj1.r[1].dist(obj2.r[1]);
   }
   void TimeUpdate(){
        rr = pow(R, 2);
        PVector e12 = PVector.mult(PVector.sub(obj2.r[1], obj1.r[1]), 1/R);
        PVector e21 = PVector.mult(PVector.sub(obj1.r[1], obj2.r[1]), 1/R);
        
        obj1.r[2].x = 2*obj1.r[1].x - obj1.r[0].x + G*obj2.mass/rr * e12.x;
        obj1.r[2].y = 2*obj1.r[1].y - obj1.r[0].y + G*obj2.mass/rr * e12.y;
        
        obj2.r[2].x = 2*obj2.r[1].x - obj2.r[0].x + G*obj1.mass/rr * e21.x;
        obj2.r[2].y = 2*obj2.r[1].y - obj2.r[0].y + G*obj1.mass/rr * e21.y;
        
        obj1.step();
        obj2.step();
   }
   void Return(Object O1, Object O2){
        O1 = obj1;
        O2 = obj2;
   }

}
