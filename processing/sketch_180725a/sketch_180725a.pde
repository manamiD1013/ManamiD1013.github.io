MyCircle circle1;
MyCircle circle2;

void setup(){
 size(500,500);
 circle1 = new MyCircle(width/2,height/2,20);
 circle2 = new MyCircle(width*0.3,height*0.3,50);
}
void draw(){
 circle1.move();
 circle1.display();
 circle2.move();
 circle2.display();
}