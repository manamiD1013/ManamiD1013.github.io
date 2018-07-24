//東京都の2016年の降水量の月合計値（mm）
float[] tokyoRain = {85.0,57.0,103.0,120.0,137.5,174.5,81.5,414.0,287.0,96.5,139.0,84.0};



//
void setup(){
  size(500,500);
  background(255);
  colorMode(HSB,360,100,100);
  //座標変換
  translate(width/2,height/2);
 //ループ 
  for(int i=0; i<12;i+=1){
    println(tokyoRain[i]);  println(tokyoRain[i]);
    //線の色
    stroke(i*30,100,100);
    //半径
    float radius = map(tokyoRain[i],0,500,0,320);
    float x = radius * cos(radians(i*30));
    float y = radius * sin(radians(i*30));
    line(0,0,x,y);
  }
}
  

void draw(){
}