class Powerup extends Obstacle{
  String type;
  Powerup(float x, float y, int type){
   xcor=x;
   ycor=y;
   if (type==0){
     this.type="life";
   } else if (type<11){
     this.type="100";
   } else if (type<18){
     this.type="250";
   } else if (type<23){
     this.type="500";
   } else {
     this.type="freq";
   }
  }
  void display(){
     ellipseMode(CENTER);
     stroke(-5);
     if (type=="100"){
       fill(#00FF00);
     }
     if (type=="250"){
       fill(#006600);
     }
     if (type=="500"){
       fill(#003300);
     }
     if (type=="freq"){
       fill(#9900CC);
     }
     if (type=="dead"){
       fill(#FF0000);
     }
     ellipse(xcor,ycor, 25, 25);
  }
}
