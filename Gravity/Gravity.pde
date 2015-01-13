void setup() {
  size(500,500);
  smooth();
  background(255);
}

float x = 100;
float y = 100;
float velocity=0;
float gravity=.5; 
boolean gravityTrue= true;
boolean left = false;
boolean right = false;
Hero a;

void keyPressed() {
  
  if(key== 'a' || key== 'A'){
      left = true;
      right=false;
    }
  if(key== 'd' || key== 'D'){
      left = false;
      right = true;
    }
}
void keyReleased(){
   if (key== ' '){
     velocity = 0;
      gravity= -gravity;
      gravityTrue= !gravityTrue;
    } 
    if (key== 'a'||key=='A'){
        left=false;
    }
    if (key == 'd' || key =='D'){
        right=false;
    }  
}


void draw() {
  background(55,88,100);
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  stroke(0);
  fill(175);
  a= new Hero();
  a.move();
}
