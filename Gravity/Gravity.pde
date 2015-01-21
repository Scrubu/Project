import java.util.*;
import java.io.*;
import ddf.minim.*;
Minim minim;
AudioPlayer player, introMusic;
PImage img, img2, curs, intro, bg, bg2;
PFont gravy, reg, end;
boolean intro2=true;
boolean freq;
ArrayList<Obstacle> obs;
ArrayList<Obstacle> disp;
ArrayList<PowerUp> pwr;
Hero a;
Obstacle start;
Obstacle start2;
int highscore=loadHS();
int score;
int frequency = 1000;
int life;
void setup() {
  minim=new Minim(this);
  player=minim.loadFile("song.mp3");
  score=0;
  life=3;
  obs = new ArrayList<Obstacle>();  
  disp = new ArrayList<Obstacle>();
  pwr = new ArrayList<PowerUp>();
  bg = loadImage("tsun2.jpg");
  bg2= loadImage("tsun.jpg");
  img=loadImage("hat.png");
  img2=loadImage("hat2.png");
  curs=loadImage("curs.png");
  intro=loadImage("intro.jpg");
  freq=false;
  size(1280,716);
  smooth();
  //intro2=true;
  a=new Hero();
  if (intro2){        
    gravy=loadFont("Bauhaus93-48.vlw");
    reg=loadFont("AngsanaNew-48.vlw");
    //start= new Obstacle(200,0,15000,100);
    start2= new Obstacle(200,700,15000,400);
  } else{
    start= new Obstacle(200,100,1500,100);
    start2= new Obstacle(200,700,1500,100);
    obs.add(start);
  }
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
  for (int y=0;y<pwr.size();y++){
    a.powerCollision(pwr.get(y));
    if (!a.pwrup.equals("")){
      pwr.remove(y);
      y--;
      println(a.pwrup); 
    }
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
    if (life==0){
      bg2.resize(width, height);
      obs.clear();
      pwr.clear();
      background(bg2);
      textFont(gravy, 125);
      text("EMBRACE DEATH OR",50,300);
      text("PRESS R TO RESTART", 50,500);
      fill(200,20,20);
      noLoop();
      updateHS();
    } else {
      obs.clear();
      pwr.clear();
      a=new Hero();
      life-=1;
    }
  }
}
void lifeDisplay(){
  textSize(50);
  text("LIVES: "+life, 1100, 100);
  fill(0, 102, 153);
}
void score(){
  if (a.velocity==0){
    score+=1;
    //println("turtle");
  }
  calcFrequency();
  textSize(50);
  text("SCORE: "+score, 10, 100); 
  text("HIGHSCORE: "+highscore,10,200);
  fill(0, 102, 153);
}
void calcFrequency(){
  if (freq){
    frequency=250;
  } else {
    if (score<200){
      frequency=100;
    } else if (score<400){
      frequency=200;
    } else if (score<900){
      frequency=300;
    }else if (score<1600){
      frequency=400;
    }else if (score<2500){
      frequency=500;
    }else if (score<3600){
      frequency=600;
    }else {
      frequency=1000;
    }
  }
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

void usePowerUp(){
   if (a.pwrup=="100"){
     score+=100;
     a.pwrup="";
   }
   if (a.pwrup=="250"){
     score+=250;
     a.pwrup="";
   }
   if (a.pwrup=="500"){
     score+=500;
     a.pwrup="";
   }
   if (a.pwrup=="freq"){
     freq=true;
     a.pwrup="";
   }
   if (a.pwrup=="life"){
     life+=1;
     a.pwrup="";
   }
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
    int num = rand.nextInt(frequency);
    if(num<5){
      int x = width;
      int y = rand.nextInt(height);
      int w = rand.nextInt(100)+20;
      int h = rand.nextInt(100)+20;
      Obstacle b = new Obstacle(x,y,w,h);
      obs.add(b);
    }
    Random rand2=new Random();
    Random rand3=new Random();
    int numPwr = rand2.nextInt(500);
    int power = rand3.nextInt(26);
    if(numPwr<5){
      int x = width;
      int y = rand.nextInt(height);
      PowerUp c = new PowerUp(x,y,power);
      pwr.add(c);
    }
    if(highscore<score){
       highscore=score; 
    }
    death();
    death();
  }
  for(int x=0;x<obs.size();x++){
    obs.get(x).move();
    obs.get(x).display(); 
  }  
  for(int y=0;y<pwr.size();y++){
    pwr.get(y).move();
    pwr.get(y).display(); 
  }   
  drawChar();
  a.display();
  collide();
  if (!intro2){
     lifeDisplay();
     lifeDisplay();
     score();
     score();
     usePowerUp();
  }
  a.move();
  player.play();
}
