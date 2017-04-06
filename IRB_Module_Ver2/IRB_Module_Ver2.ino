// Code for IRB Module
// Northwestern University - Wound Exudate Team
// Last Updated: April 5th, 2017
#include <Snooze.h>
#include <SD.h>


#define ONE_1 = 0;      // Binary 1 for ONE's is Pin 0
#define ONE_2 = 1;      // Binary 2 for ONE's is Pin 1
#define ONE_4 = 2;      // Binary 4 for ONE's is Pin 2
#define ONE_8 = 3;      // Binary 8 for ONE's is Pin 3
                        // Pin 4 reserved for SD communication
#define TEN_1 = 5;      // Binary 1 for TEN's is Pin 5
#define TEN_2 = 6;      // Binary 2 for TEN's is Pin 6
#define TEN_4 = 7;      // Binary 4 for TEN's is Pin 7
#define TEN_8 = 8;      // Binary 8 for TEN's is Pin 8

int ID = 0;             // Initializes global variable "ID" used for patient ID number


// Teensy set to hibernate mode -- approx IDD = 15 uA
// USB regulator put into a low power state (not used)
SnoozeAlarm alarm;
SnoozeBlock config_teensy36(alarm);   // Configures Snooze to use Alarm drivers

void setup() {
  // Initialize Snooze Triggers
  alarm.setAlarm(0, 30, 0);           // Uses RTC to wakeup after (0 HOURS, 30 MINUTES, 0 SECONDS)

  // Thumbwheel switch pin setup
  pinMode(ONE_1, INPUT_PULLUP);       // Input mode with pullup resistors
  pinMode(ONE_2, INPUT_PULLUP);
  pinMode(ONE_4, INPUT_PULLUP);
  pinMode(ONE_8, INPUT_PULLUP);

  pinMode(TEN_1, INPUT_PULLUP);
  pinMode(TEN_2, INPUT_PULLUP);
  pinMode(TEN_4, INPUT_PULLUP);
  pinMode(TEN_8, INPUT_PULLUP);

  // Assign patient ID number
  int ONE_1_val = digitalRead(ONE_1);
  int ONE_2_val = digitalRead(ONE_2);
  int ONE_4_val = digitalRead(ONE_4);
  int ONE_8_val = digitalRead(ONE_8);
  
  int TEN_1_val = digitalRead(TEN_1);
  int TEN_2_val = digitalRead(TEN_2);
  int TEN_4_val = digitalRead(TEN_4);
  int TEN_8_val = digitalRead(TEN_8);

  int ONES = 1*ONE_1_val + 2*ONE_2_val + 4*ONE_4_val + 8*ONE_8_val;
  int TENS = 1*TEN_1_val + 2*TEN_2_val + 4*TEN_4_val + 8*TEN_8_val;

  ID = 10*TENS + ONES;

  // Initialize SD card and SD card library
  SD.begin();
  String ID_name = String(ID);

  if (!SD.exists(ID_name)) {          // Creates file directory for patient with ID number
    SD.mkdir(ID_name);
  }

}

void loop() {
  int who = Snooze.hibernate(config_teensy36);

  if (who == 35)  {                   // Value of 35 is RTC wakeup condition
    
  }

}
