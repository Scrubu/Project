void setup() {
  size(500,500);
  smooth();
  background(255);
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
  a.display();  
  a.move();
  b=new Obstacle(100,100,50,50);
  obs.add(b);
  a.collision(b);
}
