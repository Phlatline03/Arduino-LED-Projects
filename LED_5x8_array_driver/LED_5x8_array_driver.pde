//********************************************//
//  Name    : LED 5x8 array Driver            //
//  Author  : Bob Davis                       //
//  Date    : 12 March, 2013                  //
//  Version : 1.0                             //
//********************************************//
// Pins for the Seven Segments
int Col1 = 1;
int Col2 = 2;
int Col3 = 3;
int Col4 = 4;
int Col5 = 5;
int Col6 = 6;
int Col7 = 7;
int Col8 = 8;
int Row1 = 9;
int Row2 = 10;
int Row3 = 11;
int Row4 = 12;
int Row5 = 13;
// data to make a letter A
byte bitmap [8]={0, 4, 10, 17, 31, 17, 17, 17};
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
  pinMode(Row1, OUTPUT);
  pinMode(Row2, OUTPUT);
  pinMode(Row3, OUTPUT);
  pinMode(Row4, OUTPUT);
  pinMode(Row5, OUTPUT);
}
void loop() {
  for (byte row = 1; row < 6; row++){
    // set up the data in the columns
    if bitRead(bitmap[row],1) digitalWrite (Col1, HIGH); else digitalWrite (Col1, LOW); 
    if bitRead(bitmap[row],2) digitalWrite (Col2, HIGH); else digitalWrite (Col2, LOW); 
    if bitRead(bitmap[row],3) digitalWrite (Col3, HIGH); else digitalWrite (Col3, LOW); 
    if bitRead(bitmap[row],4) digitalWrite (Col4, HIGH); else digitalWrite (Col4, LOW); 
    if bitRead(bitmap[row],5) digitalWrite (Col5, HIGH); else digitalWrite (Col5, LOW); 
    if bitRead(bitmap[row],6) digitalWrite (Col6, HIGH); else digitalWrite (Col6, LOW); 
    if bitRead(bitmap[row],7) digitalWrite (Col7, HIGH); else digitalWrite (Col7, LOW); 
    // turn on the associated row
    if (row == 1) digitalWrite (Row1, HIGH); else digitalWrite (Row1, LOW); 
    if (row == 2) digitalWrite (Row2, HIGH); else digitalWrite (Row2, LOW); 
    if (row == 3) digitalWrite (Row3, HIGH); else digitalWrite (Row3, LOW); 
    if (row == 4) digitalWrite (Row4, HIGH); else digitalWrite (Row4, LOW); 
    if (row == 5) digitalWrite (Row5, HIGH); else digitalWrite (Row5, LOW); 
    delay(5);   
}  } 


