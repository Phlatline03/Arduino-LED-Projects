//****************************************************//
//  Name    : LED Driver                          //
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
int LED8Pin = 8;
// Set the pins to output to the LED's
void setup() {
  pinMode(LED1Pin, OUTPUT);
  pinMode(LED2Pin, OUTPUT);
  pinMode(LED3Pin, OUTPUT);
  pinMode(LED4Pin, OUTPUT);
  pinMode(LED5Pin, OUTPUT);
  pinMode(LED6Pin, OUTPUT);
  pinMode(LED7Pin, OUTPUT);
  pinMode(LED8Pin, OUTPUT);
}
void loop() {
  for (int prize = 1; prize < 9; prize++){
  if (analogRead(0) < 500){ 
    digitalWrite (LED1Pin, LOW); 
    digitalWrite (LED2Pin, LOW); 
    digitalWrite (LED3Pin, LOW); 
    digitalWrite (LED4Pin, LOW); 
    digitalWrite (LED5Pin, LOW); 
    digitalWrite (LED6Pin, LOW); 
    digitalWrite (LED7Pin, LOW); 
    digitalWrite (LED8Pin, LOW); 
    if (prize==1) digitalWrite (LED1Pin, HIGH);
    if (prize==2) digitalWrite (LED2Pin, HIGH); 
    if (prize==3) digitalWrite (LED3Pin, HIGH);
    if (prize==4) digitalWrite (LED4Pin, HIGH);
    if (prize==5) digitalWrite (LED5Pin, HIGH);
    if (prize==6) digitalWrite (LED6Pin, HIGH);
    if (prize==7) digitalWrite (LED7Pin, HIGH);
    if (prize==8) digitalWrite (LED8Pin, HIGH);
    } 
  delay(500);
  }
}

