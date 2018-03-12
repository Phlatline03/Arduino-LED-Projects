//********************************************//
//  Name    : LED 8x8 array Driver           //
//  Author  : Bob Davis                            //
//  Date    : 12 March, 2013                    //
//  Version : 1.0                                       //
//********************************************//
// Pins for the LED Array
int Col1 = 1;
int Col2 = 2;
int Col3 = 3;
int Col4 = 4;
int Col5 = 5;
int Col6 = 6;
int Col7 = 7;
int Col8 = 8;
int Row4 = 9;
int Row3 = 10;
int Row2 = 11;
int Row1 = 12;
int Row8 = A1;
int Row7 = A2;
int Row6 = A3;
int Row5 = A4;
// array to make a smiley face
byte bitmap [8]={60, 66, 165, 129, 165, 153, 66, 60};

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
  pinMode(Row6, OUTPUT);
  pinMode(Row7, OUTPUT);
  pinMode(Row8, OUTPUT);
}
void loop() {
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
    digitalWrite (Row1, LOW);
    digitalWrite (Row2, LOW);
    digitalWrite (Row3, LOW);
    digitalWrite (Row4, LOW);
    digitalWrite (Row5, LOW);
    digitalWrite (Row6, LOW);
    digitalWrite (Row7, LOW);
    digitalWrite (Row8, LOW);
    // set up the data in the columns
    if bitRead(bitmap[row],0) digitalWrite (Col1, LOW);  
    if bitRead(bitmap[row],1) digitalWrite (Col2, LOW);  
    if bitRead(bitmap[row],2) digitalWrite (Col3, LOW);  
    if bitRead(bitmap[row],3) digitalWrite (Col4, LOW);  
    if bitRead(bitmap[row],4) digitalWrite (Col5, LOW);  
    if bitRead(bitmap[row],5) digitalWrite (Col6, LOW);  
    if bitRead(bitmap[row],6) digitalWrite (Col7, LOW);  
    if bitRead(bitmap[row],7) digitalWrite (Col8, LOW);  
    // turn on the associated row
    if (row == 0) digitalWrite (Row1, HIGH); 
    if (row == 1) digitalWrite (Row2, HIGH);  
    if (row == 2) digitalWrite (Row3, HIGH);  
    if (row == 3) digitalWrite (Row4, HIGH);  
    if (row == 4) digitalWrite (Row5, HIGH);  
    if (row == 5) digitalWrite (Row6, HIGH);  
    if (row == 6) digitalWrite (Row7, HIGH);  
    if (row == 7) digitalWrite (Row8, HIGH);  
    delay(3);   
}  } 


