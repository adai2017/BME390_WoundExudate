// Code for Regular IR Modules (No Bluetooth)
#include <Snooze.h>

#define HI 255

// Load drivers
SnoozeCompare compare;
SnoozeAlarm alarm;

SnoozeBlock config_teensy36(compare, alarm);  // Configures Snooze to use Compare and RTC Alarm drivers

void setup() {
  // Initialize Snooze Triggers
  alarm.setAlarm(0, 0, 10); // Uses RTC to wakeup after (hours, mins, secs)

  pinMode(11, INPUT);              // Initializes Pin 11 as input for compare
  compare.pinMode(11, HIGH, 2.5);  // LOW triggers wakeup at values LESS THAN threshold. For GREATER THAN, use HIGH
                                   // Can only use pins 11 and 12 on Teensy 3.6
  
  // Initialize Pins
  pinMode(A5, OUTPUT);
  pinMode(A4, OUTPUT);
  pinMode(A1, OUTPUT);

}

void loop() {
  int who;

  who = Snooze.hibernate(config_teensy36);

  if (who == 34) {                  // Value of 34 is for compare wakeup
      analogWrite(A5, HI);
      delay(500);
      analogWrite(A5, LOW);
      delay(500);
  }

  if (who == 35)  {                 // Value of 35 is for RTC wakeup
    for (int i = 0; i < 2; i++) {
      analogWrite(A5, HI);
      delay(1000);
      analogWrite(A5, LOW);
      delay(1000);
      analogWrite(A4, HI);
      delay(1000);
      analogWrite(A4, LOW);
      delay(1000);
      analogWrite(A1, HI);
      delay(1000);
      analogWrite(A1, LOW);
      delay(1000);
    }
  }

}
