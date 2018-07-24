//配列とfor文を一緒に作るときは[]がよく使われる
//円の数
int NUM =20;

float[] posX = new float[NUM];
float[] posY = new float[NUM];
float[] speedX = new float[NUM];
float[] speedY = new float[NUM];
float diameter;

void setup(){
  size(500,500);
  colorMode(HSB,360,100,100);
  for(int i = 0;i<NUM;i++){
  posX[i] = width/2;
  posY[i] = height/2;
  speedX[i] = random(-8,8);
  speedY[i] = random(-8,8);
  }
   diameter = 20;
}
void draw(){
  background(0);
  noStroke();
  fill(0,100,100);
  for(int i=0;i<NUM;i++){
  ellipse(posX[i],posY[i],diameter,diameter);
  posX[i] = posX[i] + speedX[i];
  posY[i] = posY[i] + speedY[i];
   if(posX[i]<0 ||posX[i]>width){
     speedX[i] = speedX[i]*-1;
   }
   if(posY[i]<0||posY[i]>height){
     speedY[i] = speedY[i]*-1;
   }
}
}