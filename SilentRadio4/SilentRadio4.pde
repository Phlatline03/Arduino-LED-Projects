
//**************************************************************//
//  Name    : Silent Radio Driver                               //
//  Author  : Bob Davis                                         //
//  Date    : 25 April, 2011                                    //
//  Version : 1.0                                               //
//****************************************************************
// Pins for the row drivers
int row1Pin = 1;
int row2Pin = 2;
int row3Pin = 3;
int row4Pin = 4;
int row5Pin = 5;
int row6Pin = 6;
int row7Pin = 7;

// Pins for column shift registers
int clockPin = 8;
int dataPin = 9;

// Set the pins to output to the circuit
void setup() {
  pinMode(clockPin, OUTPUT);
  pinMode(dataPin, OUTPUT);
  pinMode(row1Pin, OUTPUT);
  pinMode(row2Pin, OUTPUT);
  pinMode(row3Pin, OUTPUT);
  pinMode(row4Pin, OUTPUT);
  pinMode(row5Pin, OUTPUT);
  pinMode(row6Pin, OUTPUT);
  pinMode(row7Pin, OUTPUT);
}

//=== F O N T ===
// Font courtesy of aspro648
// http://www.arduino.cc/cgi-bin/yabb2/YaBB.pl?num=1203747843/22
// First char is @, next is A, B, etc.  Only lower case, no symbols.  
// The @ will display as space character.
byte alphabets[][5] = {
  {0,0,0,0,0},
  {31, 36, 68, 36, 31},
  {127, 73, 73, 73, 54},
  {62, 65, 65, 65, 34},
  {127, 65, 65, 34, 28},
  {127, 73, 73, 65, 65},
  {127, 72, 72, 72, 64},
  {62, 65, 65, 69, 38},
  {127, 8, 8, 8, 127},
  {0, 65, 127, 65, 0},
  {2, 1, 1, 1, 126},
  {127, 8, 20, 34, 65},
  {127, 1, 1, 1, 1},
  {127, 32, 16, 32, 127},
  {127, 32, 16, 8, 127},
  {62, 65, 65, 65, 62},
  {127, 72, 72, 72, 48},
  {62, 65, 69, 66, 61},
  {127, 72, 76, 74, 49},
  {50, 73, 73, 73, 38},
  {64, 64, 127, 64, 64},
  {126, 1, 1, 1, 126},
  {124, 2, 1, 2, 124},
  {126, 1, 6, 1, 126},
  {99, 20, 8, 20, 99},
  {96, 16, 15, 16, 96},
  {67, 69, 73, 81, 97},
};

// This routine takes whatever we've setup in the bitmap array and display it on the matrix
void RunDisplay()
{
  for (int row = 0; row < 8; row++) {
    //-- turn off the display --
    digitalWrite(row1Pin, LOW);  
    digitalWrite(row2Pin, LOW);  
    digitalWrite(row3Pin, LOW);  
    digitalWrite(row4Pin, LOW);  
    digitalWrite(row5Pin, LOW);  
    digitalWrite(row6Pin, LOW);  
    digitalWrite(row7Pin, LOW); 
    //-- turn the current row on --
    if (row = 1) shiftOut (dataPin, clockPin, LSBFIRST, row);
    if (row = 2) shiftOut (dataPin, clockPin, LSBFIRST, row);
    if (row = 3) shiftOut (dataPin, clockPin, LSBFIRST, row);
    if (row = 4) shiftOut (dataPin, clockPin, LSBFIRST, row);
    if (row = 5) shiftOut (dataPin, clockPin, MSBFIRST, row);
    if (row = 6) shiftOut (dataPin, clockPin, MSBFIRST, row);
    if (row = 7) shiftOut (dataPin, clockPin, MSBFIRST, row);
    if (row = 1) digitalWrite (row7Pin, HIGH);  
    if (row = 2) digitalWrite (row2Pin, HIGH);  
    if (row = 3) digitalWrite (row3Pin, HIGH);  
    if (row = 4) digitalWrite (row4Pin, HIGH);  
    if (row = 5) digitalWrite (row5Pin, HIGH);  
    if (row = 6) digitalWrite (row6Pin, HIGH);  
    if (row = 7) digitalWrite (row7Pin, HIGH);  

    delayMicroseconds(5000);
  }
}

//=== L O O P ===

void loop() {
  RunDisplay();
} 

