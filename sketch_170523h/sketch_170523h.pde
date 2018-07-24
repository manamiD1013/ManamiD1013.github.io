//回転の角度
int angle;

void setup(){
  size(500,500);
  angle = 0;
}
void draw(){
  background(0);
  noStroke();
  
  //rotate(radians(30));
  fill(0,0,255);
  rectMode(CENTER);
  rect(250,250,200,200);//青い四角形
  //ここで座標保存(pushMatrix)----------------
  pushMatrix();
  //座標変換で真ん中へ
  translate(width/2,height/2);
  rotate(radians(angle));
  fill(255,0,0);
  rect(0,0,100,100);//赤い四角形
  //ここで元の座標に戻す(popMatrix)------------
  popMatrix();
   fill(0,255,0);
  rect(250,250,50,50);
  angle++;
  if(angle>360){
    angle=0;
  }
 
}