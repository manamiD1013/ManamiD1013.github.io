int x;
int y;
void setup(){
  size(500,500);
  background(255);
  x=int(randomPosX(200)); 
  y=int(randomPosY(200));
}
void draw(){
  background(255);
face(x,y);
 x += 2;
 y += 4;
 println(calc(10,20));
}
void face(int aX,int aY){
 noFill();
  stroke(0);
  ellipse(aX,aY,100,100);
   
  noStroke();
  fill(0);
  ellipse(aX-20,aY-20,10,20);
  ellipse(aX+20,aY-20,10,20);
}
//ランダムなX座標を返す変数
float randomPosX(int aX){
  float posX=random(0,aX);
  return posX;
}
//ランダムなY座標を返す変数
float randomPosY(int aY){
  float posY = random(0,aY);
  return posY;
}
int calc(int aNum1,int aNum2){
  return aNum1+aNum2;
}