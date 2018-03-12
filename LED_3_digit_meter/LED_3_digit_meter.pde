//********************************************//
//  Name    : LED Meter Driver 3           //
//  Author  : Bob Davis                       //
//  Date    : 12 March, 2013                  //
//  Version : 1.0                             //
//********************************************//
// Pins for the Seven Segments
int SegA = 1;
int SegB = 2;
int SegC = 3;
int SegD = 4;
int SegE = 5;
int SegF = 6;
int SegG = 7;
int DispA = 8;
int DispB = 9;
int DispC = 10;
int temp = 0;
byte dig1; 
byte dig2; 
byte dig3; 
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
  pinMode(DispC, OUTPUT);
}
void loop() {
  // 5V=1024 so if you divide by 2.05 then 5V=500
  // 70 degrees is .7 volts is 070
  temp = analogRead(0)/2.05;
  dig1 = (temp % 10);   // gives right digit
  dig2 = (temp / 10) % 10;  // gives middle digit
  dig3 = temp / 100;    // gives left digit
  pass++;

  if (pass == 1){  
    digitalWrite (DispA, LOW);
    digitalWrite (DispB, HIGH);
    digitalWrite (DispC, HIGH);
    digit = dig1;
      }
  if (pass == 2) {
    digitalWrite (DispA, HIGH);
    digitalWrite (DispB, LOW);
    digitalWrite (DispC, HIGH);
    digit = dig2;
      }
  if (pass == 3) {
    digitalWrite (DispA, HIGH);
    digitalWrite (DispB, HIGH);
    digitalWrite (DispC, LOW);
    digit = dig3;
    pass = 0;
      }    
    digitalWrite (SegA, LOW); 
    digitalWrite (SegB, LOW); 
    digitalWrite (SegC, LOW); 
    digitalWrite (SegD, LOW); 
    digitalWrite (SegE, LOW); 
    digitalWrite (SegF, LOW); 
    digitalWrite (SegG, LOW);    
    if (digit == 1){
      digitalWrite (SegB, HIGH);
      digitalWrite (SegC, HIGH);
      }
    if (digit == 2){
      digitalWrite (SegA, HIGH);
      digitalWrite (SegB, HIGH);
      digitalWrite (SegD, HIGH);
      digitalWrite (SegE, HIGH);
      digitalWrite (SegG, HIGH);
      }
    if (digit == 3){
      digitalWrite (SegA, HIGH);
      digitalWrite (SegB, HIGH);
      digitalWrite (SegC, HIGH);
      digitalWrite (SegD, HIGH);
      digitalWrite (SegG, HIGH);
      }
    if (digit == 4){
      digitalWrite (SegB, HIGH);
      digitalWrite (SegC, HIGH);
      digitalWrite (SegF, HIGH);
      digitalWrite (SegG, HIGH);
      }
    if (digit == 5){
      digitalWrite (SegA, HIGH);
      digitalWrite (SegC, HIGH);
      digitalWrite (SegD, HIGH);
      digitalWrite (SegF, HIGH);
      digitalWrite (SegG, HIGH);
      }
    if (digit == 6){
      digitalWrite (SegA, HIGH);
      digitalWrite (SegC, HIGH);
      digitalWrite (SegD, HIGH);
      digitalWrite (SegE, HIGH);
      digitalWrite (SegF, HIGH);
      digitalWrite (SegG, HIGH);
      }
    if (digit == 7){
      digitalWrite (SegA, HIGH);
      digitalWrite (SegB, HIGH);
      digitalWrite (SegC, HIGH);
      }
    if (digit == 8){
      digitalWrite (SegA, HIGH);
      digitalWrite (SegB, HIGH);
      digitalWrite (SegC, HIGH);
      digitalWrite (SegD, HIGH);
      digitalWrite (SegE, HIGH);
      digitalWrite (SegF, HIGH);
      digitalWrite (SegG, HIGH);
      }
    if (digit == 9){
      digitalWrite (SegA, HIGH);
      digitalWrite (SegB, HIGH);
      digitalWrite (SegC, HIGH);
      digitalWrite (SegD, HIGH);
      digitalWrite (SegF, HIGH);
      digitalWrite (SegG, HIGH);
      }
    if (digit == 0){
      digitalWrite (SegA, HIGH);
      digitalWrite (SegB, HIGH);
      digitalWrite (SegC, HIGH);
      digitalWrite (SegD, HIGH);
      digitalWrite (SegE, HIGH);
      digitalWrite (SegF, HIGH);
      }
    if (digit >= 10){   //out of range
      digitalWrite (SegG, HIGH);
      }
    delay(5);
   } 


