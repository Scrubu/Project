public class Hero {
  boolean collision=false;;
  float radi=16;
  int health;
  float x,y;
  public Hero() {
    ellipseMode(RADIUS);
    ellipse(x, y, 16, 16);
    this.x = x;
    this.y = y;
  }
  
  float getX(){
   return x; 
  }
  float getY(){
   return y; 
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
     println(x+radi);
     println(xlimit1);
     println(collision);
    }
    else{
     collision = false; 
     println(x+radi);
     println(xlimit1);
     println(collision);
    }
  }

}

