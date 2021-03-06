
//****************************************************//
//  Name    : Cadaces Driver                          //
//  Author  : Bob Davis                               //
//  Date    : 4 January, 2013                         //
//  Version : 1.0                                     //
//****************************************************//
// Pins for the row drivers
int row1Pin = 1;
int row2Pin = 2;
int row3Pin = 3;
int rowEnable = 4;

// Pins for column shift registers
int rclockPin = 5;
int clockPin = 6;
int dataPin = 7;
int clockPin1 = 8;
int dataPin1 = 9;
int clockPin2 = 10;
int dataPin2 = 11;
int clockPin3 = 12;
int dataPin3 = 13;

// Set the pins to output to the sign
void setup() {
  pinMode(row1Pin, OUTPUT);
  pinMode(row2Pin, OUTPUT);
  pinMode(row3Pin, OUTPUT);
  pinMode(rowEnable, OUTPUT);
  pinMode(rclockPin, OUTPUT);
  pinMode(clockPin, OUTPUT);
  pinMode(dataPin, OUTPUT);
  pinMode(clockPin1, OUTPUT);
  pinMode(dataPin1, OUTPUT);
  pinMode(clockPin2, OUTPUT);
  pinMode(dataPin2, OUTPUT);
  pinMode(clockPin3, OUTPUT);
  pinMode(dataPin3, OUTPUT);
}

//=== Character Array ===
// Characters are A, B, C, etc.  Only upper case, no symbols.  
byte alphabets[][8] = {
  {0, 04, 10, 17, 17, 31, 17, 17}, //A
  {0, 30, 17, 17, 30, 17, 17, 30}, //B
  {0, 14, 17, 16, 16, 16, 17, 14}, //C
  {0, 28, 18, 17, 17, 17, 18, 28}, //D
  {0, 31, 16, 16, 31, 16, 16, 31}, //E
  {0, 31, 16, 16, 31, 16, 16, 16}, //F
  {0, 14, 17, 16, 16, 19, 17, 14}, //G
  {0, 17, 17, 17, 31, 17, 17, 17}, //H
  {0, 14, 04, 04, 04, 04, 04, 14}, //I
  {0, 07, 02, 02, 02, 02, 10, 14}, //J
  {0, 17, 18, 20, 24, 20, 18, 17}, //K
  {0, 16, 16, 16, 16, 16, 16, 31}, //L
  {0, 10, 21, 21, 21, 17, 17, 17}, //M
  {0, 17, 25, 25, 21, 19, 19, 17}, //N
  {0, 14, 17, 17, 17, 17, 17, 14}, //O
  {0, 30, 17, 17, 30, 16, 16, 16}, //P
  {0, 14, 17, 17, 17, 17, 19, 15}, //Q
  {0, 30, 17, 17, 30, 20, 18, 17}, //R
  {0, 14, 17, 16, 14, 01, 17, 14}, //S
  {0, 31, 04, 04, 04, 04, 04, 04}, //T
  {0, 17, 17, 17, 17, 17, 17, 14}, //U
  {0, 17, 17, 17, 10, 10, 10, 04}, //V
  {0, 17, 17, 17, 21, 21, 21, 10}, //W
  {0, 17, 17, 10, 04, 10, 17, 17}, //X
  {0, 17, 10, 10, 04, 04, 04, 04}, //Y
  {0, 31, 8, 04, 02, 04, 8, 31}, //Z
};
byte bitmap[][8] = {
  {0, 30, 17, 17, 30, 17, 17, 30}, //B
  {0, 14, 04, 04, 04, 04, 04, 14}, //I
  {0, 14, 17, 16, 16, 19, 17, 14}, //G
  {0, 0,0,0,0,0,0,0},
  {0,  4, 10, 17, 17, 31, 17, 17}, //A
  {0, 30, 17, 17, 30, 20, 18, 17}, //R
  {0, 28, 18, 17, 17, 17, 18, 28}, //D
  {0, 17, 17, 17, 17, 17, 17, 14}, //U
  {0, 14, 04, 04, 04, 04, 04, 14}, //I
  {0, 17, 25, 25, 21, 19, 19, 17}, //N
  {0, 14, 17, 17, 17, 17, 17, 14}, //O
  {0, 0,0,0,0,0,0,0},
  {0, 14, 17, 16, 14, 01, 17, 14}, //S
  {0, 14, 04, 04, 04, 04, 04, 14}, //I
  {0, 14, 17, 16, 16, 19, 17, 14}, //G
  {0, 17, 25, 25, 21, 19, 19, 17}, //N
  {0, 0,0,0,0,0,0,0},
};

void RunSign()
{
  for (int row = 7; row > 0; row--)
  {
    // turn off display
    digitalWrite(rowEnable, HIGH); 
    // send serial data to display 15 = number of led arrays
    for (int character = 0; character < 16; character++)
    {
//    shiftOut(dataPin, clockPin, MSBFIRST, bitmap[character][row]);
//    shiftOut(dataPin1, clockPin1, MSBFIRST, bitmap[character][row]);
//    shiftOut(dataPin2, clockPin2, MSBFIRST, bitmap[character][row]);
    shiftOut(dataPin3, clockPin3, MSBFIRST, bitmap[character][row]);
    }
    //latch the data
    digitalWrite(rclockPin, LOW); digitalWrite(rclockPin, HIGH); 
    // set up 74138 row sesection and turn display back on
    digitalWrite(row1Pin, LOW);  
    digitalWrite(row2Pin, LOW);  
    digitalWrite(row3Pin, LOW);  
    if (row==1 or row==3 or row==5 or row==7) digitalWrite (row1Pin, HIGH);  
    if (row==2 or row==3 or row==6 or row==7) digitalWrite (row2Pin, HIGH);  
    if (row >= 4) digitalWrite (row3Pin, HIGH);
    digitalWrite(rowEnable, LOW);
    // Wait to see what we sent to the display ;
    delayMicroseconds(500); 
  }
}  

//=== L O O P ===
void loop() {
  RunSign();
}
