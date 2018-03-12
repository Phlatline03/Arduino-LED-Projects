//********************************************//
//  Name    : LED 24x40 array Driver    
//  Author  : Bob Davis                           
//  Date    : 12 May, 2013                   
//  Version : 1.0                                
//********************************************//
// Pins for the clocks and data
int TCLK = 1;
int TSerial = 5;
int BCLK = 6;
int BSerial = 3;
int Strobe = 4;
int OutEnable = 2;

// arrays to say Arduino
byte Tbitmap[][8] = {  //Green characters
  {0,  4, 10, 17, 17, 31, 17, 17}, //A
  {0, 0,0,0,0,0,0,0},
  {0, 28, 18, 17, 17, 17, 18, 28}, //D
  {0, 0,0,0,0,0,0,0},
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
byte Bbitmap[][8] = {  //Red characters
  {0,  4, 10, 17, 17, 31, 17, 17}, //A
  {0, 30, 17, 17, 30, 20, 18, 17}, //R
  {0, 0,0,0,0,0,0,0},
  {0, 17, 17, 17, 17, 17, 17, 14}, //U
  {0, 14, 04, 04, 04, 04, 04, 14}, //I
  {0, 0,0,0,0,0,0,0},
  {0, 14, 17, 17, 17, 17, 17, 14}, //O
  {0, 0,0,0,0,0,0,0},
  {0, 14, 17, 16, 14, 01, 17, 14}, //S
  {0, 14, 04, 04, 04, 04, 04, 14}, //I
  {0, 14, 17, 16, 16, 19, 17, 14}, //G
  {0, 17, 25, 25, 21, 19, 19, 17}, //N
  {0, 0,0,0,0,0,0,0},
};
// Set the pins to output to the array
void setup() {
  pinMode(TCLK, OUTPUT);
  pinMode(TSerial, OUTPUT);
  pinMode(BCLK, OUTPUT);
  pinMode(BSerial, OUTPUT);
  pinMode(Strobe, OUTPUT);
  pinMode(OutEnable, OUTPUT);
}
void loop() {
  for (int row = 0; row < 8; row++){  //there are actually 16 rows
    for (int character = 8; character >= 0; character--){
      for (int shiftbit = 0; shiftbit < 6; shiftbit++){
      digitalWrite(TSerial, HIGH); 
      digitalWrite(BSerial, HIGH);
      if bitRead(Tbitmap[character][row],shiftbit) digitalWrite(TSerial, LOW); 
      if bitRead(Bbitmap[character][row],shiftbit) digitalWrite(BSerial, LOW); 
      digitalWrite(TCLK, HIGH); 
      digitalWrite(TCLK, LOW);
      digitalWrite(BCLK, HIGH); 
      digitalWrite(BCLK, LOW);
    }   }
    digitalWrite(OutEnable, HIGH);  // turns off display
    if (row==0) digitalWrite(OutEnable, LOW);  // turns on display
    digitalWrite(Strobe, LOW);  //latch the data
    digitalWrite(Strobe, HIGH);
    digitalWrite(OutEnable, LOW);  // turns on display
    delay(.5);   
}   }  
