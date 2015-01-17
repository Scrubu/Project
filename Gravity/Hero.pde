public class Hero {
  boolean collision=false;;
  float radi=16;
  int health;
  float x=100;
  float y=100;
  float velocity=0;
float gravity=.5; 
boolean gravityTrue= true;
boolean left = false;
boolean right = false;

  public Hero() {
  }
  
  void display(){
    ellipseMode(RADIUS);
    ellipse(x, y, 16, 16);

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
        println("dicks");
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
    float xlimit1 = a.getX() + (.5 * a.getW());
    float xlimit2 = a.getX() - (.5 * a.getW());
    float ylimit1 = a.getY() + (.5 * a.getH());
    float ylimit2 = a.getY() - (.5 * a.getH());
    
    if(x > xlimit1){// && x < xlimit2 && y > ylimit1 && y < ylimit2){
     collision=true; 

    }
    else{
     collision = false; 

    }
  }

}

