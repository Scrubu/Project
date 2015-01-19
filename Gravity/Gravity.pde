import java.util.Random;
PImage img, img2, curs, intro;
boolean intro2;
void setup() {
  img=loadImage("hat.png");
  img2=loadImage("hat2.png");
  curs=loadImage("curs.png");
  intro=loadImage("intro.jpg");
  size(1000,562);
  smooth();
  intro2=true;
}
ArrayList<Obstacle> obs = new ArrayList<Obstacle>();


Hero a=new Hero();



 void keyPressed() {
  
  if(key== 'a' || key== 'A'){
a.collisionUp=false;
a.collisionDown=false;
       a.setLeft(true);
       a.setRight(false);

  }
  if(key== 'd' || key== 'D'){
     

       a.setLeft(false);
       a.setRight(true);

  }
 }
void keyReleased(){
   if (key== ' ' ){
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
void introduction(){
  intro.resize(width, height);
  background(intro);
  cursor(curs);
  noStroke();
  fill(255,10);
  //rect(0,0,width,height);
  stroke(0);    
  fill(175);
}
void draw() {
//  if (intro2){
//    introduction();
//  } else{
    Random rand = new Random();
    background(55,88,100);
    noStroke();
    fill(255,10);
  //rect(0,0,width,height);
    stroke(0);
    fill(175);
  int num = rand.nextInt(100);
  if(num<2){
    int x = width;
    int y = rand.nextInt(height);
    int w = rand.nextInt(100)+20;
    int h = rand.nextInt(100)+20;
    Obstacle b = new Obstacle(x,y,w,h);
    obs.add(b);
  }
  for(int x=0;x<obs.size();x++){
    obs.get(x).move();
   obs.get(x).display(); 
  }
    drawChar();
    a.display();
    collide();
    a.move();
 // }
}
