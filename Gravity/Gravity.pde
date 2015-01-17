PImage img;
void setup() {
  size(500,500);
  smooth();
  background(255);
  img=loadImage("hat.png");
}

ArrayList obs = new ArrayList<Obstacle>();


Hero a=new Hero();
Obstacle b;

 void keyPressed() {
  
  if(key== 'a' || key== 'A'){
      a.setLeft(true);
      a.setRight(false);
  
    }
  if(key== 'd' || key== 'D'){
      a.setLeft(false);
      a.setRight(true);

    }
}
void keyReleased(){
   if (key== ' '){
     a.setVel(0);
     a.setGrav(-1);
    } 
    if (key== 'a'||key=='A'){
        a.setLeft(false);
    }
    if (key == 'd' || key =='D'){
        a.setRight(false);

    }  
}
     

void draw() {
  background(55,88,100);
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  stroke(0);
  fill(175);
 image(img,a.getX()-img.width/2,a.getY()-img.height/2);
  a.display();
  a.getX();
  
  a.move();

  //a.collision(b);
}
