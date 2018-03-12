
//**************************************************************//
//  Name    : shiftOutCode, Hello World                         //
//  Author  : Carlyn Maw,Tom Igoe                               //
//  Date    : 25 Oct, 2006                                      //
//  Version : 1.0                                               //
//  Notes   : Code for using a 74HC595 Shift Register           //
//          : to count from 0 to 255                            //
//****************************************************************
int column1Pin = 1;
int column2Pin = 2;
int column3Pin = 3;
int column4Pin = 4;
int column5Pin = 5;
int column6Pin = 6;
int column7Pin = 7;

//Pin connected to latch-not used
int latchPin = 10;
//Pin connected to Shift Clock
int clockPin = 8;
////Pin connected to Data
int dataPin = 9;

void setup() {
  //set pins to output because they are addressed in the main loop
  pinMode(latchPin, OUTPUT);
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
  //count up routine
  for (int j = 0; j < 256; j++) {
    //ground latchPin and hold low for as long as you are transmitting
    digitalWrite(latchPin, LOW);
    shiftOut(dataPin, clockPin, LSBFIRST, j);   
    //return the latch pin high to signal chip that it 
    //no longer needs to listen for information
    digitalWrite(latchPin, HIGH);
    delay(1000);
  }
} 

