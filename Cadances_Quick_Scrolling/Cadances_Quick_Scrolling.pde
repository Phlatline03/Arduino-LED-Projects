
//**************************************************************//
//  Name    : Cadaces Scrolling                               //
//  Author  : Bob Davis                                         //
//  Date    : 2 January, 2013                                    //
//  Version : 1.0                                               //
//  Based on work of Hari Wiguna - http://g33k.blogspot.com/    //
//****************************************************************
// Pins for the row drivers
int row1Pin = 2;
int row2Pin = 7;
int row3Pin = 1;
int rowEnable = 8;
int rclockPin = 6;
int clockPin = 3;
int dataPin = 5;
int gdataPin = 4;  	

// Set the pins to output to the circuit
void setup() {
  pinMode(clockPin, OUTPUT);
  pinMode(dataPin, OUTPUT);
  pinMode(row1Pin, OUTPUT);
  pinMode(row2Pin, OUTPUT);
  pinMode(row3Pin, OUTPUT);
  pinMode(rowEnable, OUTPUT);
  pinMode(rclockPin, OUTPUT);
  pinMode(gdataPin, OUTPUT);
}

//=== B I T M A P ===
// Bits in this array represents one LED of the matrix
// 8 is number of rows, 10 is number of LED matrixes we have
byte bitmap[8][10]; // Change the 10 to however many matrices you want to use.
int numZones = sizeof(bitmap) / 8; 
// I will refer to each group of 8 columns (represented by one matrix) as a Zone.
int maxZoneIndex = numZones-1;
int numCols = numZones * 8;

//=== F O N T ===
// Font courtesy of aspro648
// http://www.arduino.cc/cgi-bin/yabb2/YaBB.pl?num=1203747843/22
// First char is @, next is A, B, etc.  Only upper case, no symbols.  
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

//=== F U N C T I O N S ===
// This routine takes whatever we've setup in the bitmap array and display it on the matrix
void RefreshDisplay()
{
  for (int row = 0; row < 8; row++) {
    //-- turn off the display --
    digitalWrite(rowEnable, HIGH); 

    //-- Shift out to each matrix (zone is 8 columns represented by one matrix)
    for (int zone = maxZoneIndex; zone >= 0; zone--) {
      shiftOut(dataPin, clockPin, MSBFIRST, bitmap[row][zone]);
    }
    digitalWrite(rclockPin, LOW); 
    digitalWrite(rclockPin, HIGH);
    //-- turn the current row on --
  //  int invrow=row
    digitalWrite(row1Pin, HIGH);  
    digitalWrite(row2Pin, HIGH);  
    digitalWrite(row3Pin, HIGH);  
    if bitRead(row,0) digitalWrite (row1Pin, LOW);  
    if bitRead(row,1) digitalWrite (row2Pin, LOW);  
    if bitRead(row,2) digitalWrite (row3Pin, LOW);
    digitalWrite(rowEnable, LOW);
    
    //-- Wait a little bit to let humans see what we've pushed out onto the matrix ;
    delayMicroseconds(500);
  }
}

// Converts row and colum to actual bitmap bit and turn it off/on
void Plot(int col, int row, bool isOn)
{
  int zone = col / 8;
  int colBitIndex = col % 8;
  byte colBit = 1 << colBitIndex;
  if (isOn)
    bitmap[row][zone] =  bitmap[row][zone] | colBit;
  else
    bitmap[row][zone] =  bitmap[row][zone] & (~colBit);
}

// Plot each character of the message one column at a time, updated the display, shift bitmap left.
void AlphabetSoup()
{
//load in the characters
  char msg[] = "ARDUINO LED SIGN ";
  for (int charIndex=0; charIndex < (sizeof(msg)-1); charIndex++)
  {
    int alphabetIndex = msg[charIndex] - '@';
    if (alphabetIndex < 0) alphabetIndex = 0;
    //-- Draw one character of the message --
    for (int col = 0; col < 6; col++)
    {
      for (int row = 0; row < 8; row++)
      {
        // Set the pixel to the alphabet for columns 0 thru 4
        bool isOn = 0;
        if (col<5) isOn = bitRead( alphabets[alphabetIndex][col], 7-row ) == 1;
        Plot( numCols-1, row, isOn); 
      }
      //-- The more times you repeat this loop, the slower we would scroll --
      for (int refreshCount=0; refreshCount < 50; refreshCount++)
        RefreshDisplay();
      //-- Shift the bitmap one column to left --
      for (int row=0; row<8; row++) //right shift
      {
        for (int zone=0; zone < numZones; zone++)
        {
          // This right shift would show a left scroll on display.
          bitmap[row][zone] = bitmap[row][zone] >> 1;  //right shift
          // Roll over lowest bit from the next zone as highest bit of this zone.
          if (zone < maxZoneIndex) bitWrite(bitmap[row][zone], 7, bitRead(bitmap[row][zone+1], 0));
        }
      }
    }
  }
} 
//=== L O O P ===
void loop() {
  AlphabetSoup();
} 


