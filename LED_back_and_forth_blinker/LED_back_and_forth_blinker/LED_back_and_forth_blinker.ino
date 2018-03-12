
//***********************************************
//  Name    : LED Back and Forth                 
//  Author  : Bob Davis                                  
//  Date    : 5 March, 2013                            
//  Version : 1.0                                            
//***********************************************
// Pins for the LED's
int LED1Pin = 1;
int LED2Pin = 2;
int LED3Pin = 3;
int LED4Pin = 4;
int LED5Pin = 5;
int LED6Pin = 6;
int LED7Pin = 7;
int LED8Pin = 8;
int LED9Pin = 9;
int LED10Pin = 10;
int LED11Pin = 11;
int LED12Pin = 12;
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
  pinMode(LED9Pin, OUTPUT);
  pinMode(LED10Pin, OUTPUT);
}
void loop() {
  for (int scan = 1; scan < 19; scan++){
    digitalWrite (LED1Pin, LOW); 
    digitalWrite (LED2Pin, LOW); 
    digitalWrite (LED3Pin, LOW); 
    digitalWrite (LED4Pin, LOW); 
    digitalWrite (LED5Pin, LOW); 
    digitalWrite (LED6Pin, LOW); 
    digitalWrite (LED7Pin, LOW); 
    digitalWrite (LED8Pin, LOW); 
    digitalWrite (LED9Pin, LOW); 
    digitalWrite (LED10Pin, LOW); 
    if (scan ==1) digitalWrite (LED1Pin, HIGH);
    if (scan ==2) digitalWrite (LED2Pin, HIGH); 
    if (scan ==3) digitalWrite (LED3Pin, HIGH);
    if (scan ==4) digitalWrite (LED4Pin, HIGH);
    if (scan ==5) digitalWrite (LED5Pin, HIGH);
    if (scan ==6) digitalWrite (LED6Pin, HIGH);
    if (scan ==7) digitalWrite (LED7Pin, HIGH);
    if (scan ==8) digitalWrite (LED8Pin, HIGH);
    if (scan ==9) digitalWrite (LED9Pin, HIGH);
    if (scan ==10) digitalWrite (LED10Pin, HIGH); 
    if (scan ==11) digitalWrite (LED9Pin, HIGH);
    if (scan ==12) digitalWrite (LED8Pin, HIGH);
    if (scan ==13) digitalWrite (LED7Pin, HIGH);
    if (scan ==14) digitalWrite (LED6Pin, HIGH);
    if (scan ==15) digitalWrite (LED5Pin, HIGH);
    if (scan ==16) digitalWrite (LED4Pin, HIGH);
    if (scan ==17) digitalWrite (LED3Pin, HIGH);
    if (scan ==18) digitalWrite (LED2Pin, HIGH);
  delay(200);
  }
}

