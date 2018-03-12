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
int LED7Pin = 7;
int in0Pin = 14;
int in1Pin = 15;
int in2Pin = 16;
int in3Pin = 17;
int in4Pin = 18;
int in5Pin = 19;
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
  pinMode(LED7Pin, OUTPUT);
  pinMode(in0Pin, INPUT);
  pinMode(in1Pin, INPUT);
  pinMode(in2Pin, INPUT);
  pinMode(in3Pin, INPUT);
  pinMode(in4Pin, INPUT);
  pinMode(in5Pin, INPUT);
  pinMode(ResSwitch, INPUT);  
  pinMode(ResSwitch, INPUT);  
  pinMode(ResSwitch, INPUT);
  pinMode(BeepPin, OUTPUT);
  digitalWrite(in0Pin, HIGH);
  digitalWrite(in1Pin, HIGH);
  digitalWrite(in2Pin, HIGH);
  digitalWrite(in3Pin, HIGH);
  digitalWrite(in4Pin, HIGH);
  digitalWrite(in5Pin, HIGH);
  digitalWrite(ResSwitch, HIGH);
}
void loop() {
  if (latch == 0){
    digitalWrite (LED1Pin, LOW); 
    digitalWrite (LED2Pin, LOW); 
    digitalWrite (LED3Pin, LOW); 
    digitalWrite (LED4Pin, LOW); 
    digitalWrite (LED5Pin, LOW); 
    digitalWrite (LED6Pin, LOW); 
    if (digitalRead(in0Pin) == LOW) {
      digitalWrite(LED6Pin, HIGH);
      latch = 1; }
    if (digitalRead(in1Pin) == LOW) {
      digitalWrite(LED5Pin, HIGH);
      latch = 1; }
    if (digitalRead(in2Pin) == LOW) {
      digitalWrite(LED4Pin, HIGH);
      latch = 1; }
    if (digitalRead(in3Pin) == LOW) {
      digitalWrite(LED3Pin, HIGH);
      latch = 1; }
    if (digitalRead(in4Pin) == LOW) {
      digitalWrite(LED2Pin, HIGH);
      latch = 1; }
    if (digitalRead(in5Pin) == LOW) {
      digitalWrite(LED1Pin, HIGH);
      latch = 1; }
  }
  if (latch == 1){
    digitalWrite (BeepPin, HIGH);
    delay(50);
    if (digitalRead(ResSwitch) == LOW){
      latch = 0;
      digitalWrite (BeepPin, LOW);  }
  }
  digitalWrite(LED7Pin, HIGH);  //power on indicator
}
