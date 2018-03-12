
//**************************************************************//
//  Name    : Silent Radio Driver                               //
//  Author  : Bob Davis                                         //
//  Date    : 25 April, 2011                                    //
//  Version : 1.0                                               //
//****************************************************************
int column1Pin = 1;
int column2Pin = 2;
int column3Pin = 3;
int column4Pin = 4;
int column5Pin = 5;
int column6Pin = 6;
int column7Pin = 7;

//Pins for shift register
int clockPin = 8;
int dataPin = 9;

void setup() {
  //set pins to silent radio circuit
  pinMode(clockPin, OUTPUT);
  pinMode(dataPin, OUTPUT);
  pinMode(column1Pin, OUTPUT);
  pinMode(column2Pin, OUTPUT);
  pinMode(column3Pin, OUTPUT);
  pinMode(column4Pin, OUTPUT);
  pinMode(column5Pin, OUTPUT);
  pinMode(column6Pin, OUTPUT);
  pinMode(column7Pin, OUTPUT);
  digitalWrite(column1Pin, HIGH);  
  digitalWrite(column2Pin, HIGH);  
  digitalWrite(column3Pin, HIGH);  
  digitalWrite(column4Pin, HIGH);  
  digitalWrite(column5Pin, HIGH);  
  digitalWrite(column6Pin, HIGH);  
  digitalWrite(column7Pin, HIGH);  
}

void loop() {
  //count up test routine
  for (int j = 0; j < 256; j++) {
    shiftOut(dataPin, clockPin, LSBFIRST, j);   
    delay(1000);
  }
} 

