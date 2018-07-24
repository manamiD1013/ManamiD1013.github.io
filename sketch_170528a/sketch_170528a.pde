import processing.serial.*;
Serial port; 
int val; 
String buff = "";
int NEWLINE = 10;


int num = 5000;
float[] posX1 = new float[num];
float[] posY1 = new float[num];
float[] posX2 = new float[num];
float[] posY2 = new float[num];
float[] speedA = new float[num];
float[] speedB = new float[num];
float[] dia = new float[num];

void setup(){

//println(Serial.list());



     String arduinoPort = Serial.list()[1];
     
     port = new Serial(this, arduinoPort, 9600);
  size(1000,1000);
  background(0);
  
  val = 20;
  
  for(int i=0;i<num;i++){
    posX1[i] = random(width);
    posY1[i] = random(height);
    posX2[i] = random(width);
    posY2[i] = random(height);
    speedA[i] = random(1,4);
    speedB[i] = random(5,10);
    dia[i] = random(15);
  }
}



  void draw(){
   background(0);
    
    while (port.available () > 0) {
        serialEvent(port.read());
    }
println(val);
    for(int i = 0;i<val;i++){
      noStroke();
      fill(255);
      ellipse(posX1[i],posY1[i],dia[i],dia[i]);
      ellipse(posX2[i],posY2[i],dia[i],dia[i]);
      posY1[i]= posY1[i] + speedA[i];
      posY2[i]= posY2[i] + speedB[i];
      if(posY1[i] > height+20 & posY2[i] > height+20){
        posY1[i] = 0;
        posY2[i] = 0;
      }
    }
  }

void serialEvent(int serial){
    if (serial != NEWLINE) {
        
        buff += char(serial);
    }
    else {
        buff = buff.substring(0, buff.length()-1);
       
        val = int(map(int(buff),0,1023,0,255));
       
        buff = "";
    }
}

  

    
    