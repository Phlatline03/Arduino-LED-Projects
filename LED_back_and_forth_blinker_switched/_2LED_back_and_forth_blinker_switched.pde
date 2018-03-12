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
// Set the pins to output to the LED's
void setup() {
  pinMode(LED1Pin, OUTPUT);
  pinMode(LED2Pin, OUTPUT);
  pinMode(LED3Pin, OUTPUT);
  pinMode(LED4Pin, OUTPUT);
  pinMode(LED5Pin, OUTPUT);
  pinMode(LED6Pin, OUTPUT);
  pinMode(LED7Pin, OUTPUT);
}
void loop() {
  if (analogRead(0) < 500){ 
    digitalWrite (LED1Pin, HIGH);
    digitalWrite (LED2Pin, LOW); 
  } 
  delay(50);
  if (analogRead(0) < 500){ 
    digitalWrite (LED2Pin, HIGH);
    digitalWrite (LED1Pin, LOW); 
  }
  delay(50); 
  }


