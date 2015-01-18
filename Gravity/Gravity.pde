PImage img, img2, curs, intro;
void setup() {
  img=loadImage("hat.png");
  img2=loadImage("hat2.png");
  curs=loadImage("cursor.gif");
  intro=loadImage("intro.jpg");
  size(1000,562);
  smooth();
  
}

ArrayList<Obstacle> obs = new ArrayList<Obstacle>();


Hero a=new Hero();
Obstacle b,c;

 void keyPressed() {
  
  if(key== 'a' || key== 'A'){
     a.collisionUp=false;
     a.collisionDown=false;
     a.collisionLeft=false;
     a.collisionRight=false;
     collide();
     if (a.collisionUp || a.collisionDown){
       a.setLeft(true);
       a.setRight(false);
     } else if(a.right){
       a.setRight(false);
     }
  }
  if(key== 'd' || key== 'D'){
     a.collisionUp=false;
     a.collisionDown=false;
     a.collisionLeft=false;
     a.collisionRight=false;
     collide();
     if (a.collisionUp || a.collisionDown){
       a.setLeft(false);
       a.setRight(true);
     } else if(a.right){
       a.setLeft(false);
     }
  }
 }
void keyReleased(){
   if (key== ' ' && (a.collisionUp || a.collisionDown)){
     a.setVel(0);
     a.setGrav(-1);
     a.collisionUp=false;
     a.collisionDown=false;
     a.collisionLeft=false;
     a.collisionRight=false;
     collide();
    } 
    if (key== 'a'||key=='A'){
        a.setLeft(false);
    }
    if (key == 'd' || key =='D'){
        a.setRight(false);

    }  
}
void collide(){
  for (int x=0;x<obs.size();x++){
     a.collision(obs.get(x));
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
  cursor(curs);
  //background(55,88,100);
  intro.resize(width, height);
  background(intro);
  noStroke();
  fill(255,10);
  //rect(0,0,width,height);
  stroke(0);
  fill(175);
  b=new Obstacle(300,100,50,50);
  b.display();
  obs.add(b);
  c=new Obstacle(100,500,5000,50);
  c.display();
  obs.add(c);
  Obstacle d=new Obstacle(500,100,5000,50);
  d.display();
  obs.add(d);
  drawChar();
  a.display();
  collide();
  a.move();
}
