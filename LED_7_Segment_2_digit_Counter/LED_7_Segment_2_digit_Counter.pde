//********************************************//
//  Name    : LED 7 Segment Driver            //
//  Author  : Bob Davis                       //
//  Date    : 12 March, 2013                  //
//  Version : 1.0                             //
//********************************************//
// Pins for the Seven Segmants
int SegA = 1;
int SegB = 2;
int SegC = 3;
int SegD = 4;
int SegE = 5;
int SegF = 6;
int SegG = 7;
int DispA = 8;
int DispB = 9;
byte count = 0;
byte dig1; // left digit
byte dig2; // right digit
int pass = 0;
int digit;
// Set the pins to output to the LED's
void setup() {
  pinMode(SegA, OUTPUT);
  pinMode(SegB, OUTPUT);
  pinMode(SegC, OUTPUT);
  pinMode(SegD, OUTPUT);
  pinMode(SegE, OUTPUT);
  pinMode(SegF, OUTPUT);
  pinMode(SegG, OUTPUT);
  pinMode(DispA, OUTPUT);
  pinMode(DispB, OUTPUT);
}
void loop() {
//  for (count = 0; count < 100; count++)
//  {
  dig1 = (count / 10);  // gives first digit
  dig2 = (count % 10); // gives remainder
  if (pass == 0){  
    digitalWrite (DispA, LOW);
    digitalWrite (DispB, HIGH);
    digit = dig1;
    pass = 1;
  }
  else {
    digitalWrite (DispA, HIGH);
    digitalWrite (DispB, LOW);
    digit = dig2;
    pass = 0;
    if (count < 100){
      count ++;
    }
    else count = 0;
  }
    digitalWrite (SegA, LOW); 
    digitalWrite (SegB, LOW); 
    digitalWrite (SegC, LOW); 
    digitalWrite (SegD, LOW); 
    digitalWrite (SegE, LOW); 
    digitalWrite (SegF, LOW); 
    digitalWrite (SegG, LOW);    
    if (count == 1){
      digitalWrite (SegB, HIGH);
      digitalWrite (SegC, HIGH);
      }
    if (count == 2){
      digitalWrite (SegA, HIGH);
      digitalWrite (SegB, HIGH);
      digitalWrite (SegD, HIGH);
      digitalWrite (SegE, HIGH);
      digitalWrite (SegG, HIGH);
      }
    if (count == 3){
      digitalWrite (SegA, HIGH);
      digitalWrite (SegB, HIGH);
      digitalWrite (SegC, HIGH);
      digitalWrite (SegD, HIGH);
      digitalWrite (SegG, HIGH);
      }
    if (count == 4){
      digitalWrite (SegB, HIGH);
      digitalWrite (SegC, HIGH);
      digitalWrite (SegF, HIGH);
      digitalWrite (SegG, HIGH);
      }
    if (count == 5){
      digitalWrite (SegA, HIGH);
      digitalWrite (SegC, HIGH);
      digitalWrite (SegD, HIGH);
      digitalWrite (SegF, HIGH);
      digitalWrite (SegG, HIGH);
      }
    if (count == 6){
      digitalWrite (SegA, HIGH);
      digitalWrite (SegC, HIGH);
      digitalWrite (SegD, HIGH);
      digitalWrite (SegE, HIGH);
      digitalWrite (SegF, HIGH);
      digitalWrite (SegG, HIGH);
      }
    if (count == 7){
      digitalWrite (SegA, HIGH);
      digitalWrite (SegB, HIGH);
      digitalWrite (SegC, HIGH);
      }
    if (count == 8){
      digitalWrite (SegA, HIGH);
      digitalWrite (SegB, HIGH);
      digitalWrite (SegC, HIGH);
      digitalWrite (SegD, HIGH);
      digitalWrite (SegE, HIGH);
      digitalWrite (SegF, HIGH);
      digitalWrite (SegG, HIGH);
      }
    if (count == 9){
      digitalWrite (SegA, HIGH);
      digitalWrite (SegB, HIGH);
      digitalWrite (SegC, HIGH);
      digitalWrite (SegD, HIGH);
      digitalWrite (SegF, HIGH);
      digitalWrite (SegG, HIGH);
      }
    if (count == 0){
      digitalWrite (SegA, HIGH);
      digitalWrite (SegB, HIGH);
      digitalWrite (SegC, HIGH);
      digitalWrite (SegD, HIGH);
      digitalWrite (SegE, HIGH);
      digitalWrite (SegF, HIGH);
      }
    delay(100);
  }  


