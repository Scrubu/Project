import java.util.*;
import java.io.*;
import ddf.minim.*;
Minim minim;
AudioPlayer player, introMusic;
PImage img, img2, curs, intro, bg;
PFont gravy, reg;
boolean intro2=true;
ArrayList<Obstacle> obs;
ArrayList<Obstacle> disp;
Hero a;
Obstacle start;
Obstacle start2;
int highscore=loadHS();
int score;
void setup() {
  minim=new Minim(this);
  player=minim.loadFile("song.mp3");
  score=0;
  obs = new ArrayList<Obstacle>();  
  disp = new ArrayList<Obstacle>();
  bg = loadImage("tsun2.jpg");
  img=loadImage("hat.png");
  img2=loadImage("hat2.png");
  curs=loadImage("curs.png");
  intro=loadImage("intro.jpg");
  size(1280,716);
  smooth();
  //intro2=true;
  a=new Hero();
  if (intro2){        
    gravy=loadFont("Bauhaus93-48.vlw");
    reg=loadFont("AngsanaNew-48.vlw");
    start= new Obstacle(200,0,15000,100);
    start2= new Obstacle(200,700,15000,400);
  } else{
    start= new Obstacle(200,100,1500,100);
    start2= new Obstacle(200,700,1500,100);
  }
   obs.add(start);
   obs.add(start2);
  //size(200, 200);
  //String[] fontList = PFont.list();
  //println(fontList);
}


void mouseClicked(){
  if (intro2){
    intro2=false;
    setup();
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
    setup();
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
  if (a.velocity==0){
    score+=1;
    //println("turtle");
  }
  textSize(50);
  text("SCORE: "+score, 10, 100); 
  text("HIGHSCORE: "+highscore,10,200);
  fill(0, 102, 153);
}
void title(){
  textFont(gravy, 200);
  text("Gravity",350,200);
  fill(#FFFFFF);
  textFont(reg, 50);
  text("Created by Java", 550, 250);
  text("Click anywhere to start", 490, 550);
  fill(#CC0000);
}

void draw() {
  Random rand = new Random();
  if(intro2){
    intro.resize(width, height);
    background(intro);
    title();
    title();
    int num = rand.nextInt(1000);
    if(num<5){
      int x = width;
      int y = rand.nextInt(height-300)+50;
      int w = rand.nextInt(100)+20;
      int h = rand.nextInt(100)+20;
      Obstacle b = new Obstacle(x,y,w,h);
      disp.add(b);
    }
    for(int x=0;x<disp.size();x++){
      disp.get(x).move();
      disp.get(x).display();  
    }
  } else {
    background(bg);
    int num = rand.nextInt(500);
    if(num<5){
      int x = width;
      int y = rand.nextInt(height);
      int w = rand.nextInt(100)+20;
      int h = rand.nextInt(100)+20;
      Obstacle b = new Obstacle(x,y,w,h);
      obs.add(b);
    }
    if(highscore<score){
       highscore=score; 
    }
    score();
    score();
    death();
    death();
  }
  for(int x=0;x<obs.size();x++){
    obs.get(x).move();
    obs.get(x).display(); 
  }   
  drawChar();
  a.display();
  collide();
  a.move();
  player.play();
}
