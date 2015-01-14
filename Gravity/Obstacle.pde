class Obstacle{
  boolean collision=false; 
  float xcor,ycor;
  Obstacle(float x, float y, float w, float h){
   rect(x,y,w,h);
   xcor=x;
   ycor=y;
  }
  Obstacle(){
   rect(100,height - 50,16,50); 
  }
  float getX(){
   return x; 
  }
  float getY(){
   return y; 
  }


}
