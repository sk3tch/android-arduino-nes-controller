#include <MeetAndroid.h>
MeetAndroid meetAndroid;

int latch = 2; // set the latch pin
int clock = 3; // set the clock pin
int datin = 4;// set the data in pin
byte controller_data = 0;


/* SETUP */
void setup() {
  Serial.begin(9600);
  pinMode(latch,OUTPUT);
  pinMode(clock,OUTPUT);
  pinMode(datin,INPUT);
  
  digitalWrite(latch,HIGH);
  digitalWrite(clock,HIGH);

}

/* THIS READS DATA FROM THE CONTROLLER */
void controllerRead() {
  controller_data = 0;
  digitalWrite(latch,LOW);
  digitalWrite(clock,LOW);
  
  digitalWrite(latch,HIGH);
  delayMicroseconds(2);
  digitalWrite(latch,LOW);
  
  controller_data = digitalRead(datin);
  
  for (int i = 1; i <= 7; i ++) {
    digitalWrite(clock,HIGH);
    delayMicroseconds(2);
    controller_data = controller_data << 1;
    controller_data = controller_data + digitalRead(datin) ;
    delayMicroseconds(4);
    digitalWrite(clock,LOW);
  }

}

/* THE LED, SERVO, AND SERIAL MONITOR PROGRAM */
void loop() {
  //meetAndroid.receive();
  controllerRead();
  //Serial.println(controller_data, BIN);
  
  // if (controller_data==B11101111){
    // Serial.println("Button has been Pressed");   
     //}  else {
     //Serial.println("Button not pressed");
     //}
  
  //for REFERENCE:  
  //UP = 11110111
  //DOWN=11111011
  //LEFT=11111101
  //RIGHT=11111110
  //SELECT=11011111
  //START=11101111
  //A=01111111
  //B=10111111
  
  /*if (controller_data & B10000000 <= B10000000){
   meetAndroid.send("A");  
   Serial.println("A");
   }
   if (controller_data & B01000000 <= B10111111){
   meetAndroid.send("B");
   Serial.println("B");
  }
  else if (controller_data==B11110111 || controller_data==B11110100){
   meetAndroid.send("UP");
   //Serial.println("UP");
  }  
  else if (controller_data==B11111011){
   meetAndroid.send("DOWN");
   //Serial.println("DOWN");
  }
  else if (controller_data==B11111110){
   meetAndroid.send("RIGHT");
   //Serial.println("RIGHT");
  }
  else if (controller_data==B11111101){
   meetAndroid.send("LEFT");
   //Serial.println("LEFT");
  }
  else if (controller_data==B11011111){
   meetAndroid.send("SELECT");
   //Serial.println("SELECT");
  }
  else if (controller_data==B11101111){
   meetAndroid.send("START");
   //Serial.println("START");
  }
  else if (controller_data==B1110100 || controller_data==B1110101){
   meetAndroid.send("UP-A");
   //Serial.println("START");
  }
  else if (controller_data==B1111101){
   meetAndroid.send("LEFT-A");
   //Serial.println("START");
  }
  else if (controller_data==B1111011){
   meetAndroid.send("LEFT-A");
   //Serial.println("START");
  }
  else if (controller_data==B1110110){
   meetAndroid.send("RIGHT-A");
   //Serial.println("START");
  }
  else if (controller_data==B10110100){
   meetAndroid.send("UP-B");
   //Serial.println("START");
  }
  else if (controller_data==B1011101){
   meetAndroid.send("LEFT-B");
   //Serial.println("START");
  }
  else if (controller_data==B10111001){
   meetAndroid.send("DOWN-B");
   //Serial.println("START");
  }
  else if (controller_data==B10111110){
   meetAndroid.send("RIGHT-B");
   //Serial.println("START");
  }
  else
  {
    meetAndroid.send(" ");
  }
  */
  meetAndroid.send(controller_data, BIN);
  //delay(10);
} 

