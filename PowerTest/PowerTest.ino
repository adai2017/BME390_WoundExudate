// Code for Power Testing of Battery
#include "Time.h"
#include "TimeLib.h"

#define HI 255
#define LO 0
#define VREF 3.3
#define LEDstate LO

void setup() {
  pinMode(A20, INPUT);    // Pin A20 used for ADC
  pinMode(A19, OUTPUT);   // Controls blink for IR LED and IR photosensor
  pinMode(A18, OUTPUT);   // Indicator LED

  Serial.begin(9600);
  
  rtc.begin();
  rtc.setTime(12, 0, 0);
  rtc.setDate(18, 2, 2017);
}

void loop() {
  int val;
  int temp = 1;
  float voltage;

  val = analogRead(A20);
  voltage = val * (VREF / 1023);

  analogWrite(A19, HI);
  delay(1000);
  analogWrite(A19, LO);
  delay(1000);

  if (voltage > 2 && temp == 1)  {
    analogWrite(A18, HI);
    temp == 0;
    // write code to get time
    // write code to print time to command console
    // Serial.println("time")
    
  }

}
