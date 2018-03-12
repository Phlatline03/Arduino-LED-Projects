                                                                                    //********************************************/
//  Name    : LED 24x40 array Driver    
//  Author  : Bob Davis                           
//  Date    : 1 May, 2013                   
//  Version : 1.0                                
//********************************************/
// Pins for the clocks and data
int TopCLK = 1;
int TopSerial = 5;
int BottomCLK = 6;
int BottomSerial = 3;
int Strobe = 4;
int OutEnable = 2;
// arrays to make a red and green smiley face
byte Tbitmap [8]={60, 66, 129, 129, 129, 129, 66, 60};
byte Bbitmap [8]={60, 66, 36, 0, 36, 24, 0, 0};
// Set the pins to output to the array
void setup() {
  pinMode(TopCLK, OUTPUT);
  pinMode(TopSerial, OUTPUT);
  pinMode(BottomCLK, OUTPUT);
  pinMode(BottomSerial, OUTPUT);
  pinMode(Strobe, OUTPUT);
  pinMode(OutEnable, OUTPUT);
}
void loop() {
  for (int row = 0; row <40; row++){
    digitalWrite(OutEnable, LOW);
    // set up the data in the columns
    for (int shiftbit = 8; shiftbit >=0; shiftbit--){
      digitalWrite(TopSerial, HIGH); 
      digitalWrite(BottomSerial, HIGH);
      if bitRead(Tbitmap[row],shiftbit) digitalWrite(TopSerial, LOW); 
      if bitRead(Bbitmap[row],shiftbit) digitalWrite(BottomSerial, LOW); 
      digitalWrite(TopCLK, HIGH); 
      digitalWrite(TopCLK, LOW);
      digitalWrite(BottomCLK, HIGH); 
      digitalWrite(BottomCLK, LOW);
      }
    //latch the data
    digitalWrite(Strobe, LOW);  
    digitalWrite(Strobe, HIGH);
    delay(2);   
}   }

