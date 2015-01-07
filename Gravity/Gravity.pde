void setup() {
  size(500,500);
  smooth();
  background(255);
}

float x = 100;
float y = 100;
float gravity=1;
void draw() {

  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  
 
  // Add the current speed to the location.
if(keyPressed){
    if(key== 'd' || key== 'D'){
      x=x+5;
    }
}
if(keyPressed){
    if(key== 'a' || key== 'A'){
      x=x-18;
    }
}
if(keyPressed){
    if (key== ' '){
      gravity=gravity*-1;
    }
}
if (gravity >0){
    if(y < height-10 ){
      y=y+gravity;
  }
  }
  else {
    if (y > 0 + 10){
      y=y+gravity;
    }
  }

  stroke(0);
  fill(175);
  ellipse(x,y,16,16);
  }
