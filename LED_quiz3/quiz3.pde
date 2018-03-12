//************************************************
//  Name    : LED Quiz Practice                     
//  Author  : Bob Davis                                   
//  Date    : 5 March, 2013                             
//  Version : 1.0                                             
//************************************************
// Pins for the LED's
int LED1Pin = 1;
int LED2Pin = 2;
int LED3Pin = 3;
int LED4Pin = 4;
int LED5Pin = 5;
int LED6Pin = 6;
int BeepPin = 11;
int ResSwitch = 12;
int latch = 0;

// Set the pins to output to the LED's
void setup() {
  pinMode(LED1Pin, OUTPUT);
  pinMode(LED2Pin, OUTPUT);
  pinMode(LED3Pin, OUTPUT);
  pinMode(LED4Pin, OUTPUT);
  pinMode(LED5Pin, OUTPUT);
  pinMode(LED6Pin, OUTPUT);
  pinMode(ResSwitch, INPUT);
  pinMode(BeepPin, OUTPUT);
  digitalWrite(A0, HIGH);
  digitalWrite(A1, HIGH);
  digitalWrite(A2, HIGH);
  digitalWrite(A3, HIGH);
  digitalWrite(A4, HIGH);
  digitalWrite(A5, HIGH);
  digitalWrite(ResSwitch, HIGH);
}
void loop() {
 // if (latch == 1){
 //   digitalWrite (BeepPin, HIGH);
 //   delay(50);
 //   if (digitalRead(ResSwitch) == LOW){
  //    latch = 0;
  //    digitalWrite (BeepPin, LOW);}
  //}
  
  if (latch == 0){
    digitalWrite (LED1Pin, LOW); 
    digitalWrite (LED2Pin, LOW); 
    digitalWrite (LED3Pin, LOW); 
    digitalWrite (LED4Pin, LOW); 
    digitalWrite (LED5Pin, LOW); 
    digitalWrite (LED6Pin, LOW); 
    if (analogRead(0) < 10){
      digitalWrite (LED6Pin, HIGH);
      latch = 1; }
    if (analogRead(1) < 10){
      digitalWrite (LED5Pin, HIGH);
      latch = 1; }
    if (analogRead(2) < 10){
      digitalWrite (LED4Pin, HIGH);
      latch = 1; }
    if (analogRead(3) < 10){
      digitalWrite (LED3Pin, HIGH);
      latch = 1; }
    if (analogRead(4) < 10){
      digitalWrite (LED2Pin, HIGH);
      latch = 1; }
    if (analogRead(5) < 10){
      digitalWrite (LED1Pin, HIGH);
      latch = 1; }
  }
}

