void setup() {
  size(500,500);
  smooth();
  background(255);
}

float x = 100;
float y = 100;
float gravity=1;
boolean gravityTrue= true;

void keyPressed() {
  
  if(key== 'd' || key== 'D'){
      x=x+5;
    }
  if(key== 'a' || key== 'A'){
      x=x-5;
    }
}
void keyReleased(){
   if (key== ' '){
      gravity= -gravity;
      gravityTrue= !gravityTrue;
    } 
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
