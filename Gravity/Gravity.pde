import java.util.*;
import java.io.*;
import ddf.minim.*;
Minim minim;
AudioPlayer player, introMusic;
PImage img, img2, curs, intro,bg;
boolean intro2, levels;
ArrayList<Obstacle> obs;
Hero a;
Obstacle start;
Obstacle start2;
int highscore=loadHS();
int score;
void setup() {
  obs = new ArrayList<Obstacle>();
  bg = loadImage("tsun2.jpg");
  img=loadImage("hat.png");
  img2=loadImage("hat2.png");
  curs=loadImage("curs.png");
  intro=loadImage("intro.jpg");
  size(1280,716);
  smooth();
  intro2=true;
  levels=false;
}


void unlimited(){
  if(levels){
    minim=new Minim(this);
    player=minim.loadFile("song.mp3");
    score=0;
    obs.clear();
    //a=new Hero();
    start= new Obstacle(200,100,1500,100);
    start2= new Obstacle(200,700,1500,100);
    obs.add(start);
    obs.add(start2);
    Random rand = new Random();
    background(bg);
    int num = rand.nextInt(100);
    if(num<5){
      int x = width;
      int y = rand.nextInt(height);
      int w = rand.nextInt(100)+20;
      int h = rand.nextInt(100)+20;
      Obstacle b = new Obstacle(x,y,w,h);
      obs.add(b);
    }
    score();
    score();
    if(highscore<score){
       highscore=score; 
    }
    for(int x=0;x<obs.size();x++){
      obs.get(x).move();
      obs.get(x).display(); 
    }   
    death();
    death();
  }
}
  

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
  if(key== 'r' || key == 'R'){
    player.close();
    unlimited();
    loop();
  }
   if (key== ' ' ){
     a.setVel();
     a.setGrav(-1);

    } 
    if (key== 'a'||key=='A'){
        a.setLeft(false);
    }
    if (key == 'd' || key =='D'){
        a.setRight(false);

    }  
}
int loadHS(){
  File HS=new File("highscore.txt");
  int x;
  try{
    Scanner high=new Scanner(HS);
    x=high.nextInt();
    //println(x);
  } catch (Exception e){
    return 1;
  }
  return x;
}
void updateHS(){
  try {
    PrintWriter deleteHS = new PrintWriter("highscore.txt");
    deleteHS.print("");
    deleteHS.close();
  } catch(Exception e){
    println("fileNotFound");
  }
  BufferedReader b=new BufferedReader(new InputStreamReader(System.in)); 
  File HS=new File("highscore.txt");
  try {
    b=new BufferedReader(new FileReader(HS));
    FileWriter f=new FileWriter(HS, true);
    f.append(String.valueOf(highscore));
    b.close();
    f.close();
  } catch(Exception e){
    println("fileNotFound");
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
  if(intro2){
    intro.resize(width, height);
    background(intro);
    cursor(curs);
    noStroke();
    fill(255,10);
    //rect(0,0,width,height);
    stroke(0);    
    fill(175);
    start= new Obstacle(200,100,1500,100);
    start2= new Obstacle(200,700,1500,100);
    obs.add(start);
    obs.add(start2);
    for(int x=0;x<obs.size();x++){
      obs.get(x).move();
      obs.get(x).display(); 
    }  
  }
}
void death(){
  if(a.getDead()==true){
    textSize(100);
    text("EMBRACE DEATH OR",100,300);
    text("PRESS R TO RESTART", 100,500);
    fill(200,20,20);
    noLoop();
    updateHS();
  }
}

void score(){
  score+=1;
  textSize(50);
text("SCORE: "+score, 10, 100); 
text("HIGHSCORE: "+highscore,10,200);
fill(0, 102, 153);
}

void draw() {
  a=new Hero();
  if (intro2){
    println("wayez");
    intro2=true;
    introduction();
  } else{
    unlimited();
  }
  drawChar();
  a.display();
  collide();
  a.move();
  //player.play();
}
