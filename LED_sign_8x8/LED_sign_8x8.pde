//********************************************
//  Name    : LED 8x8 SR array Driver    
//  Author  : Bob Davis                           
//  Date    : 12 March, 2013                   
//  Version : 1.0                                
//********************************************
// Pins for the Columns and Rows
int Row1 = 4;
int Row2 = 3;
int Row3 = 2;
int Row4 = 1;
int Row5 = 5;
int Row6 = 6;
int Row7 = 7;
int Row8 = 8;
int GSerial = 10;
int RSerial = 11;
int RCLK = 12;
int SCLK = 13;
// arrays to make a red and green smiley face
byte Gbitmap [8]={60, 66, 129, 129, 129, 129, 66, 60};
byte Rbitmap [8]={60, 66, 36, 0, 36, 24, 0, 0};
// Set the pins to output to the array
void setup() {
  pinMode(Row1, OUTPUT);
  pinMode(Row2, OUTPUT);
  pinMode(Row3, OUTPUT);
  pinMode(Row4, OUTPUT);
  pinMode(Row5, OUTPUT);
  pinMode(Row6, OUTPUT);
  pinMode(Row7, OUTPUT);
  pinMode(Row8, OUTPUT);
  pinMode(GSerial, OUTPUT);
  pinMode(RSerial, OUTPUT);
  pinMode(RCLK, OUTPUT);
  pinMode(SCLK, OUTPUT);
}
void loop() {
  for (int row = 0; row <8; row++){
    //turn everything off
    digitalWrite (Row1, LOW);
    digitalWrite (Row2, LOW);
    digitalWrite (Row3, LOW);
    digitalWrite (Row4, LOW);
    digitalWrite (Row5, LOW);
    digitalWrite (Row6, LOW);
    digitalWrite (Row7, LOW);
    digitalWrite (Row8, LOW);
    // set up the data in the columns
    for (int shiftbit = 8; shiftbit >=0; shiftbit--){
    digitalWrite(GSerial, HIGH); 
    digitalWrite(RSerial, HIGH);
    if bitRead(Gbitmap[row],shiftbit) digitalWrite(GSerial, LOW); 
    if bitRead(Rbitmap[row],shiftbit) digitalWrite(RSerial, LOW); 
    digitalWrite(SCLK, HIGH); 
    digitalWrite(SCLK, LOW);
      }
    //latch the data
    digitalWrite(RCLK, HIGH);
    digitalWrite(RCLK, LOW);  
    // turn on the associated row
    if (row == 0) digitalWrite (Row1, HIGH); 
    if (row == 1) digitalWrite (Row2, HIGH);  
    if (row == 2) digitalWrite (Row3, HIGH);  
    if (row == 3) digitalWrite (Row4, HIGH);  
    if (row == 4) digitalWrite (Row5, HIGH);  
    if (row == 5) digitalWrite (Row6, HIGH);  
    if (row == 6) digitalWrite (Row7, HIGH);  
    if (row == 7) digitalWrite (Row8, HIGH);
    delay(2);   
}   }


