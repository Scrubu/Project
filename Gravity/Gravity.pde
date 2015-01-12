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
void move(){
if (left){
    x=x-5;
  }
  else if (right){
    x+=5;
  }
  else{
    x=x;
  }
}

void draw() {
  background(55,88,100);
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  move();

  
   if (gravityTrue){
    if(y < height-10 ){
      velocity = velocity +gravity;
      y=y+velocity;
    }
      else{
      velocity =0;
      y=height-10;
     }
    }
   
   else {
    if (y > 10){
      velocity = velocity +gravity;
      y=y+velocity;
      }
    else{  
      velocity = 0;
     y=10;
    }
   }
  if (y < 8){
    y=10;
  }
  if(y>height - 10){
    y = height - 10;
  }
  
  stroke(0);
  fill(175);
 ellipse(x,y,16,16);
}
