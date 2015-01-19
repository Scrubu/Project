public class Hero {
  boolean collisionUp=false;
  boolean collisionDown=false;
  boolean collisionLeft=false;
  boolean collisionRight=false;
  float xlim=15;//half width of rect of hero to measure collision
  float ylim=35;//half height of rect of hero to measure collision
  int health;
  float x=200;
  float y=200;
  float velocity=0;
  float OriginalGrav=.5;
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
    rect(x, y, 0, 0);//rect is easier than ellipse for sprite
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
    OriginalGrav=OriginalGrav * x;
   gravity= gravity * x; 
   gravityTrue= !gravityTrue;
  }
  
  void move() { 
    
    //LEFT AND RIGHT KEYS
    if (left) {      
       x=x-5;     
      }

    
    if (right) {

      x+=5;
    
    
    }// else {
     // x=x;
    //}
    //GRAVITY ANTI-GRAVITY
    if (gravityTrue) {
      if (y < height-10 ) {

        velocity = velocity +gravity;
        y=y+velocity;
        //collisionUp=false;       
      }
    } else {
      if (y > 10) {
        
        velocity = velocity +gravity;
        y=y+velocity;
       // collisionDown=false;
       
        }
      } 
    }
    
  
  void collision(Obstacle a){
    float xlimit1 = a.getX() + (.5 * a.getW());//measures dimensions of obstacle
    float xlimit2 = a.getX() - (.5 * a.getW());
    float ylimit1 = a.getY()+ (.5 * a.getH());
    float ylimit2 = a.getY() - (.5 * a.getH());
    
    if((x-xlim<xlimit1+1 && x> xlimit2 ) && (y > ylimit2 && y < ylimit1)){//&& x < xlimit2 && y > ylimit1){
     collisionLeft=true; 
     collisionRight=false;
    }
    else{
      collisionLeft=false;
    }
    if((x+xlim>xlimit2-1 && x< xlimit1 ) && (y > ylimit2 && y < ylimit1)){
      collisionRight=true;
      collisionLeft=false;
    }
    else{
     collisionRight=false; 
    }
    if((x < xlimit1 && x>xlimit2) && (y+ylim > ylimit2-7 && y < ylimit1)){//&& x < xlimit2 && y > ylimit1){
     collisionDown=true; 
     collisionUp=false;
    }
    else{
     collisionDown=false; 
    }
     if((x < xlimit1 && x>xlimit2) && (y> ylimit2 && y-ylim < ylimit1+10)){//&& x < xlimit2 && y > ylimit1){
     collisionUp=true; 
     collisionDown=false;
    }
    else{
     collisionUp=false; 
    }
    if(collisionLeft && !collisionRight){
      x=xlimit1+20;
    }
    if(collisionRight && !collisionLeft){
     x=xlimit2 - 20; 
    }
    if(collisionUp && !collisionDown){      
      velocity= 0;
     y=ylimit1+30;
    }
    else if(collisionDown && !collisionUp){
     y=ylimit2-30; 
     velocity=0;
    }

    }
   }
