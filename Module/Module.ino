// Code for Regular IR Modules (No Bluetooth)
#include <Snooze.h>

// Load drivers
SnoozeCompare compare;
SnoozeAlarm alarm;

SnoozeBlock config_teensy36(compare, alarm);  // Configures Snooze to use Compare and Alarm drivers

// Need to define threshold voltage (absolute)
// #define threshold 1.3 

void setup() {
  // Initialize Snooze Triggers
  alarm.setAlarm(0, 30, 0) // Uses RTC to wakeup after (hours, mins, secs)
  
  // compare.pinMode(11, LOW, threshold)  // Triggers wakeup at values LESS THAN threshold. For GREATER THAN, use HIGH
  
  // Initialize Pins

}

void loop() {
  // put your main code here, to run repeatedly:

}
