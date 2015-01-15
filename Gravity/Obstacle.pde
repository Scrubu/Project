class Obstacle{
  boolean collision=false; 
  float xcor=100;
  float ycor=height-50;
  float w=16;
  float h=50;
  Obstacle(float x, float y, float w, float h){
   rectMode(CENTER);
   rect(x,y,w,h);
   xcor=x;
   ycor=y;
   this.w = w;
   this.h = h;
  }
  Obstacle(){
   rect(100,height -70,50,50); 
  }
  float getX(){
   return xcor; 
  }
  float getY(){
   return ycor; 
  }
  float getW(){
    return w;
  }
  float getH(){
   return h;
  }


}
