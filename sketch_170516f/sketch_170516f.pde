//画像を読み込む変数
PImage littleBits;
float x;
float y;
float speedX;

void setup(){
  size(500,500);
  background(255);
  colorMode(HSB,360,100,100);
  x=250;
  y=250;
  speedX=2;
  
  //変数にファイルをロードする
  littleBits = loadImage("littlebits_logo.png");

}
void draw(){
  
  background(0,0,100);
    //画像を表示する
  imageMode(CENTER);
  tint(0,100,100);
  image(littleBits,x,y,250,250);
  filter(BLUR,1);
  x=x+speedX;

 
  
}