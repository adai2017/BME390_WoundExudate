// Code for Regular IR Modules (No Bluetooth)
#include <Snooze.h>

#define IR_LED = 20;    // IR LED connected to T3.6 Pin 20
#define IR_IN = 19;     // IR Photosensor connected to T3.6 Pin 19

// Teensy set to "hibernate" mode -- approx IDD = 15 uA
// USB regulator put into a low power state
SnoozeTimer timer;

SnoozeBlock config_teensy36(timer);  // Configures Snooze to use Timer drivers

void setup() {
  // Initialize Snooze Triggers
  timer.setTimer(1800000) // Wakes up after time in milliseconds (30 mins x 60 seconds x 1000 ms = 1800000)
  
  // Initialize Pins
  pinMode(IR_LED, OUTPUT);

}

void loop() {
  int who;        // Snooze library variable
  int adcVal;     // initial ADC value
  int VREF = 3.3  // Reference Voltage for ADC (3.3 V)
  float adcVolt;  // ADC conversion to Volts
  
  who = Snooze.hibernate(config_teensy36);

  digitalWrite(IR_LED, HIGH);
  adcVal = analogRead(IR_IN);
  delay(1000);    // Waits 1000 ms
  digitalWrite(IR_LED, LOW);
  adcVolt = adcVal * (VREF / 1023);
  

  

}
