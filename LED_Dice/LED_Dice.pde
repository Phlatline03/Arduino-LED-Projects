//****************************************************//
//  Name    : LED Dice Driver                          //
//  Author  : Bob Davis                               //
//  Date    : 5 March, 2013                       //
//  Version : 1.0                                     //
//****************************************************//
// Pins for the LED's
int LED1Pin = 1;
int LED2Pin = 2;
int LED3Pin = 3;
int LED4Pin = 4;
int LED5Pin = 5;
int LED6Pin = 6;
int LED7Pin = 7;
// Set the pins to output to the LED's
void setup() {
  pinMode(LED1Pin, OUTPUT);
  pinMode(LED2Pin, OUTPUT);
  pinMode(LED3Pin, OUTPUT);
  pinMode(LED4Pin, OUTPUT);
  pinMode(LED5Pin, OUTPUT);
  pinMode(LED6Pin, OUTPUT);
  pinMode(LED7Pin, OUTPUT);
  pinMode(A0, OUTPUT);
  digitalWrite (A0, HIGH); 
}
void loop() {
  for (int dice = 1; dice < 8; dice++){
  if (digitalRead(A0) == LOW){ 
    digitalWrite (LED1Pin, LOW); 
    digitalWrite (LED2Pin, LOW); 
    digitalWrite (LED3Pin, LOW); 
    digitalWrite (LED4Pin, LOW); 
    digitalWrite (LED5Pin, LOW); 
    digitalWrite (LED6Pin, LOW); 
    digitalWrite (LED7Pin, LOW); 
    if (dice==1) digitalWrite (LED4Pin, HIGH);
    if (dice==2) {
      digitalWrite (LED2Pin, HIGH); 
      digitalWrite (LED6Pin, HIGH); }
    if (dice==3) {
      digitalWrite (LED2Pin, HIGH);
      digitalWrite (LED4Pin, HIGH);
      digitalWrite (LED6Pin, HIGH); }
    if (dice==4) {
      digitalWrite (LED1Pin, HIGH);
      digitalWrite (LED3Pin, HIGH);
      digitalWrite (LED5Pin, HIGH);
      digitalWrite (LED7Pin, HIGH); }
    if (dice==5) {
      digitalWrite (LED1Pin, HIGH);
      digitalWrite (LED3Pin, HIGH);
      digitalWrite (LED4Pin, HIGH);
      digitalWrite (LED5Pin, HIGH);
      digitalWrite (LED7Pin, HIGH); }
    if (dice==6) {
      digitalWrite (LED1Pin, HIGH);
      digitalWrite (LED2Pin, HIGH);
      digitalWrite (LED3Pin, HIGH);
      digitalWrite (LED5Pin, HIGH);
      digitalWrite (LED6Pin, HIGH);
      digitalWrite (LED7Pin, HIGH); }
    if (dice==7) {
      digitalWrite (LED1Pin, HIGH);
      digitalWrite (LED2Pin, HIGH);
      digitalWrite (LED3Pin, HIGH);
      digitalWrite (LED4Pin, HIGH);
      digitalWrite (LED5Pin, HIGH);
      digitalWrite (LED6Pin, HIGH);
      digitalWrite (LED7Pin, HIGH); }
    } 
  delay(50);
  }
}

