public class Hero {
  boolean collisionUp=false;
  boolean collisionDown=false;
  boolean collisionLeft=false;
  boolean collisionRight=false;
  float xlim=15;//half width of rect of hero to measure collision
  float ylim=35;//half height of rect of hero to measure collision
  int health;
  float x=300;
  float y=200;
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
      if(!collisionLeft){
       x=x-5;
      }

    }
    if (right) {
      if(!collisionRight){
      x+=5;
      }
    }// else {
     // x=x;
    //}
    //GRAVITY ANTI-GRAVITY
    if (gravityTrue) {
      if (y < height-10 ) {
        if(!collisionDown){
        velocity = velocity + gravity;
        y=y+velocity;       
        }
      }
       else {
        velocity =0;
        y=y;
      }
    } else {
      if (y > 10) {
        if(!collisionUp){
        velocity = velocity +gravity;
        y=y+velocity;
        }
      } else {  
        velocity = 0;
        y=y;
      }
    }
  }
  void collision(Obstacle a){
    float xlimit1 = a.getX() + (.5 * a.getW());//measures dimensions of obstacle
    float xlimit2 = a.getX() - (.5 * a.getW());
    float ylimit1 = a.getY()+ (.5 * a.getH());
    float ylimit2 = a.getY() - (.5 * a.getH());
    
    if((x-xlim < xlimit1 +1 && x>xlimit2) && (y > ylimit2 && y < ylimit1)){//&& x < xlimit2 && y > ylimit1){
     collisionLeft=true;
   
    }
  else{
    collisionLeft=false;
  }
    if((x< xlimit1 && x+xlim>xlimit2-1) && (y > ylimit2 && y < ylimit1)){//&& x < xlimit2 && y > ylimit1){
     collisionRight=true; 
    }
    else{
      collisionRight=false;
    }
    if((x-xlim < xlimit1 && x>xlimit2) && (y+ylim > ylimit2 && y-ylim < ylimit1)){//&& x < xlimit2 && y > ylimit1){
     collisionDown=true; 
     collisionUp=false;
    }
    else{
      collisionDown=false;
  //    println("LIM"+ylim);
  //    println(y+ylim);
  //    println(y-ylim);
  //    println(ylimit1);
  //    println(ylimit2);
    }
     if((x < xlimit1 && x>xlimit2) && (y> ylimit2 && y-ylim < ylimit1)){//&& x < xlimit2 && y > ylimit1){
       collisionUp=true; 
       collisionDown=false;
    }
    else{
     collisionUp=false; 
    }
  
  }

}

