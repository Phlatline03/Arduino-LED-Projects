//********************************************//
//  Name    : LED 8x8 array Driver           //
//  Author  : Bob Davis                        //
//  Date    : 12 March, 2013                   //
//  Version : 1.0                              //
//********************************************//
// Pins for the LED array
int Col1 = 1;
int Col2 = 2;
int Col3 = 3;
int Col4 = 4;
int Col5 = 5;
int Col6 = 6;
int Col7 = 7;
int Col8 = 8;
int Col9 = 9;
int Col10 = 10;
int Col11 = 11;
int Col12 = 12;
int Col13 = A1;
int Col14 = A2;
int Col15 = A3;
int Col16 = A4;
int CLK595 = 11;
int RCK595 = 12;
int SER595 = 13;
// arrays to make a dual color smiley face
byte Bbitmap [8]={60, 66, 36, 0, 36, 24, 0, 0};
byte Gbitmap [8]={60, 66, 129, 129, 129, 129, 66, 60};
byte Rbitmap [8]={60, 66, 129, 129, 129, 129, 66, 60};
// Set the pins to output to the array
void setup() {
  pinMode(Col1, OUTPUT);
  pinMode(Col2, OUTPUT);
  pinMode(Col3, OUTPUT);
  pinMode(Col4, OUTPUT);
  pinMode(Col5, OUTPUT);
  pinMode(Col6, OUTPUT);
  pinMode(Col7, OUTPUT);
  pinMode(Col8, OUTPUT);
  pinMode(Col9, OUTPUT);
  pinMode(Col10, OUTPUT);
  pinMode(Col11, OUTPUT);
  pinMode(Col12, OUTPUT);
  pinMode(Col13, OUTPUT);
  pinMode(Col14, OUTPUT);
  pinMode(Col15, OUTPUT);
  pinMode(Col16, OUTPUT);
  pinMode(CLK595, OUTPUT);
  pinMode(RCK595, OUTPUT);
  pinMode(SER595, OUTPUT);
}
void loop() {
  // there are only 8 rows 
  for (int row = 0; row <8; row++){
    //turn everything off
    digitalWrite (Col1, HIGH);
    digitalWrite (Col2, HIGH);
    digitalWrite (Col3, HIGH);
    digitalWrite (Col4, HIGH);
    digitalWrite (Col5, HIGH);
    digitalWrite (Col6, HIGH);
    digitalWrite (Col7, HIGH);
    digitalWrite (Col8, HIGH);
    digitalWrite (Col9, HIGH);
    digitalWrite (Col10, HIGH);
    digitalWrite (Col11, HIGH);
    digitalWrite (Col12, HIGH);
    digitalWrite (Col13, HIGH);
    digitalWrite (Col14, HIGH);
    digitalWrite (Col15, HIGH);
    digitalWrite (Col16, HIGH);
    // advance to the next row
    digitalWrite (SER595, LOW); 
    if (row == 0) digitalWrite (SER595, HIGH);
    digitalWrite (CLK595, LOW); 
    digitalWrite (CLK595, HIGH);
    digitalWrite (RCK595, LOW); 
    digitalWrite (RCK595, HIGH);
    // turn on the data bits for the columns
    if bitRead(Gbitmap[row],0) digitalWrite (Col1, LOW);  
    if bitRead(Gbitmap[row],1) digitalWrite (Col2, LOW);  
    if bitRead(Gbitmap[row],2) digitalWrite (Col3, LOW);  
    if bitRead(Gbitmap[row],3) digitalWrite (Col4, LOW);  
    if bitRead(Gbitmap[row],4) digitalWrite (Col5, LOW);  
    if bitRead(Gbitmap[row],5) digitalWrite (Col6, LOW);  
    if bitRead(Gbitmap[row],6) digitalWrite (Col7, LOW);  
    if bitRead(Gbitmap[row],7) digitalWrite (Col8, LOW);  
    if bitRead(Rbitmap[row],0) digitalWrite (Col9, LOW);  
    if bitRead(Rbitmap[row],1) digitalWrite (Col10, LOW);  
    if bitRead(Rbitmap[row],2) digitalWrite (Col11, LOW);  
    if bitRead(Rbitmap[row],3) digitalWrite (Col12, LOW);  
    if bitRead(Rbitmap[row],4) digitalWrite (Col13, LOW);  
    if bitRead(Rbitmap[row],5) digitalWrite (Col14, LOW);  
    if bitRead(Rbitmap[row],6) digitalWrite (Col15, LOW);  
    if bitRead(Rbitmap[row],7) digitalWrite (Col16, LOW);  
    delay(3);   
}  } 


