public class Hero {
  boolean collision;
  float collisionCor;
  int health;
  public Hero() {
    ellipse(x, y, 16, 16);
  }
  
  float getX(){
   return x; 
  }
  float getY(){
   return y; 
  }
  void move() {
    
    if(collision){
     x=collisionCor;
    }
    
    //LEFT AND RIGHT KEYS
    if (left) {
      x=x-5;
    } else if (right) {
      x+=5;
    } else {
      x=x;
    }
    //GRAVITY ANTI-GRAVITY
    if (gravityTrue) {
      if (y < height-10 ) {
        velocity = velocity +gravity;
        y=y+velocity;
      } else {
        velocity =0;
        y=height-10;
      }
    } else {
      if (y > 10) {
        velocity = velocity +gravity;
        y=y+velocity;
      } else {  
        velocity = 0;
        y=10;
      }
    }
    if (y < 8) {
      y=10;
    }
    if (y>height - 10) {
      y = height - 10;
    }
  }
  void collision(Obstacle a){
    if(a.getX()>x){
      collision=true;
       collisionCor=a.getX();
    }
    else{
       collision= false;
   }
  }
}

