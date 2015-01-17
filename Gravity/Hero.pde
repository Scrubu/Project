public class Hero {
  boolean collision=false;;
  float xlim=15;//half width of rect of hero to measure collision
  float ylim=35;//half height of rect of hero to measure collision
  int health;
  float x=200;
  float y=100;
  float velocity=0;
float gravity=.5; 
boolean gravityTrue= true;
boolean left = false;
boolean right = false;

  public Hero() {
  }
  
  void display(){
    rectMode(CENTER);
    //add noStroke() here
    fill(0,0,0,0);
    rect(x, y, 30, 60);//rect is easier than ellipse for sprite
  }
  float getX(){

   return x;
   
  }
  float getY(){
   return y; 
  }
  void setLeft(boolean x){
   left=x; 
  }
  void setRight(boolean x){
   right = x; 
  }
  void setVel(float x){
   velocity=x; 
  }
  void setGrav(float x){
   gravity= gravity * x; 
   gravityTrue= !gravityTrue;
  }
  
  void move() { 
    
    //LEFT AND RIGHT KEYS
    if (left) {
      if(!(collision)){
       x=x-5;
      }

    }
    if (right) {
      if(!collision){
      x+=5;
      }
    }// else {
     // x=x;
    //}
    //GRAVITY ANTI-GRAVITY
    if (gravityTrue) {
      if (y < height-10 ) {
        if(!collision){
        velocity = velocity +gravity;
        y=y+velocity;
        }
      } else {
        velocity =0;
        y=height-10;
      }
    } else {
      if (y > 10) {
        if(!collision){
        velocity = velocity +gravity;
        y=y+velocity;
        }
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
    float xlimit1 = a.getX() + (.5 * a.getW());//measures dimensions of obstacle
    float xlimit2 = a.getX() - (.5 * a.getW());
    float ylimit1 = a.getY()+ (.5 * a.getH());
    float ylimit2 = a.getY() - (.5 * a.getH());
    
    if((x-xlim < xlimit1 && x+xlim>xlimit2) && (y+ylim > ylimit2 && y-ylim < ylimit1)){//&& x < xlimit2 && y > ylimit1){
     collision=true; 

    }
    else{
     collision = false; 
     println(x);
      println(xlimit1);
    }
  }

}

