PImage img, img2;
void setup() {
  size(500,500);
  smooth();
  background(255);
  img=loadImage("hat.png");
  img2=loadImage("hat2.png");
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
     
void drawChar(){
  if (a.gravityTrue){
     image(img,a.getX()-img.width/2,a.getY()-img.height/2);
  } else {
    image(img2,a.getX()-img2.width/2,a.getY()-img2.height/2);
  }
}
void draw() {
  background(55,88,100);
  noStroke();
  fill(255,10);
  //rect(0,0,width,height);
  stroke(0);
  fill(175);
  drawChar();
  a.display();
  a.getX();
  b=new Obstacle(100,100,50,50);
  b.display();
  obs.add(b);
  a.collision(b);
  a.move();
}
