void setup() {
  size(500,500);
  smooth();
  background(255);
}

float x = 100;
float y = 100;
float gravity=1;
boolean gravityTrue= true;
boolean left = false;
boolean right = false;

void keyPressed() {
  
  if(key== 'd' || key== 'D'){
      left = false;
      right=true;
    }
  if(key== 'a' || key== 'A'){
      left = true;
      right = false;
    }
}
void keyReleased(){
   if (key== ' '){
      gravity= -gravity;
      gravityTrue= !gravityTrue;
    } 
}

void move(){
  if (left || !right){
    x=x+5;
  }
  else if (!left || right){
    x-=5;
  }
  else if (left==right){
    x=x;
  }
 System.out.println("lol");
}
void draw() {
  background(55,88,100);
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  
if (gravityTrue){
    if(y < height-10 ){
      y=y+gravity;
  }
  }
  else {
    if (y > 10){
      y=y+gravity;
    }
  }

  stroke(0);
  fill(175);
  ellipse(x,y,16,16);
  }
