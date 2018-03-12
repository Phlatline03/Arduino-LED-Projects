//**********************************
//  Name    : Cadaces Driver                          
//  Author  : Bob Davis                               	
//  Date    : 23 February, 2013                       	
//  Version : 1.0                                     	
//**********************************
// Pins for the row drivers
int row1Pin = 2;	//R1
int row2Pin = 7;	//R2
int row3Pin = 1;	//R3
int rowEnable = 8;	//REN
int rclockPin = 6;	//RCK
int clockPin = 3; 	//SCK
int dataPin = 5; 	//RSD
int gdataPin = 4;  	//GSD
// Set the pins to output to the sign
void setup() {
  pinMode(row1Pin, OUTPUT);
  pinMode(row2Pin, OUTPUT);
  pinMode(row3Pin, OUTPUT);
  pinMode(rowEnable, OUTPUT);
  pinMode(rclockPin, OUTPUT);
  pinMode(clockPin, OUTPUT);
  pinMode(dataPin, OUTPUT);
  pinMode(gdataPin, OUTPUT);
}
byte bitmap[][8] = {  //red characters
  {0, 0,0,0,0,0,0,0},
  {0,  4, 10, 17, 17, 31, 17, 17}, //A
  {0, 30, 17, 17, 30, 20, 18, 17}, //R
  {0, 28, 18, 17, 17, 17, 18, 28}, //D
  {0, 0,0,0,0,0,0,0},
  {0, 14, 04, 04, 04, 04, 04, 14}, //I
  {0, 17, 25, 25, 21, 19, 19, 17}, //N
  {0, 14, 17, 17, 17, 17, 17, 14}, //O
  {0, 0,0,0,0,0,0,0},
};
byte gbitmap[][8] = {  //green characters
  {0, 0,0,0,0,0,0,0},
  {0,  4, 10, 17, 17, 31, 17, 17}, //A
  {0, 30, 17, 17, 30, 20, 18, 17}, //R
  {0, 0,0,0,0,0,0,0},
  {0, 17, 17, 17, 17, 17, 17, 14}, //U
  {0, 14, 04, 04, 04, 04, 04, 14}, //I
  {0, 0,0,0,0,0,0,0},
  {0, 14, 17, 17, 17, 17, 17, 14}, //O
  {0, 0,0,0,0,0,0,0},
};
void RunSign(){
  for (int row = 7; row > 0; row--) {
    // turn off display
    digitalWrite(rowEnable, HIGH); 
    digitalWrite(rclockPin, LOW); 
    // send serial data to display 8 = number of characters
    for (int character = 0; character < 8; character++){
     for (int shiftbit = 5; shiftbit > -1; shiftbit--){
      digitalWrite(gdataPin, LOW);
      digitalWrite(dataPin, LOW);
      if bitRead(gbitmap[character][row],shiftbit) digitalWrite(gdataPin, HIGH); 
      if bitRead(bitmap[character][row],shiftbit) digitalWrite(dataPin, HIGH); 
      digitalWrite(clockPin, HIGH); digitalWrite(clockPin, LOW);
    } }
    //latch the data
    digitalWrite(rclockPin, HIGH);
    // set up 74138 row selection and turn display back on
    digitalWrite(row1Pin, LOW);
    digitalWrite(row2Pin, LOW);
    digitalWrite(row3Pin, LOW);
    if bitRead(row,0) digitalWrite (row1Pin, HIGH); 
    if bitRead(row,1) digitalWrite (row2Pin, HIGH); 
    if bitRead(row,2) digitalWrite (row3Pin, HIGH); 
    digitalWrite(rowEnable, LOW);
    // Wait to see what we sent to the display ;
    delayMicroseconds(500); 
  }
}  

//=== L O O P ===
void loop() {
  RunSign();
}

