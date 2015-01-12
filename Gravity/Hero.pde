public class Hero {

  int health;
  public Hero() {
    ellipse(x, y, 16, 16);
  }
  void move() {
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
}

