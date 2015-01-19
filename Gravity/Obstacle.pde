class Obstacle{
  boolean collision=false; 
  float xcor=100;
  float ycor=height-50;
  float w=50;
  float h=50;
  Obstacle(float x, float y, float w, float h){
   xcor=x;
   ycor=y;
   this.w=w;
   this.h=h;
  }
  Obstacle(){
  }
  void move(){
   xcor-= 2; 
  }
  void display(){
     rectMode(CENTER);
     stroke(-5);
     fill(0,0,0,90);
     rect(xcor,ycor,w,h);
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

