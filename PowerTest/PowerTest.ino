// Code for Power Testing of Battery
#include <TimeLib.h>


#define HI 255
#define LO 0
#define VREF 3.3


void setup() {
  pinMode(A20, INPUT);    // Pin A20 used for ADC
  pinMode(A18, OUTPUT);   // Indicator LED

  setSyncProvider(getTeensy3Time);
  
  Serial.begin(115200);
  while (!Serial);  // Wait for Arduino Serial Monitor to open
  delay(100);
  if (timeStatus()!= timeSet) {
    Serial.println("Unable to sync with the RTC");
  } else {
    Serial.println("RTC has set the system time");
  }

}

void loop() {
  int val;
  int temp = 1;
  float voltage;

  val = analogRead(A20);
  voltage = val * (VREF / 1023);

  if (voltage < 2 && temp == 1)  {
    analogWrite(A18, HI);
    temp = 0;
    // write code to get time
    // write code to print time to command console
    // Serial.println("time")
    
  }

  if (Serial.available()) {
    time_t t = processSyncMessage();
    if (t != 0) {
      Teensy3Clock.set(t); // set the RTC
      setTime(t);
    }
  }
  digitalClockDisplay();  
  delay(1000);
}

time_t getTeensy3Time()
{
  return Teensy3Clock.get();
}

void digitalClockDisplay() {
  // digital clock display of the time
  Serial.print(hour());
  printDigits(minute());
  printDigits(second());
  Serial.print(" ");
  Serial.print(day());
  Serial.print(" ");
  Serial.print(month());
  Serial.print(" ");
  Serial.print(year()); 
  Serial.println(); 
}

/*  code to process time sync messages from the serial port   */
#define TIME_HEADER  "T"   // Header tag for serial time sync message

unsigned long processSyncMessage() {
  unsigned long pctime = 0L;
  const unsigned long DEFAULT_TIME = 1357041600; // Jan 1 2013 

  if(Serial.find(TIME_HEADER)) {
     pctime = Serial.parseInt();
     return pctime;
     if( pctime < DEFAULT_TIME) { // check the value is a valid time (greater than Jan 1 2013)
       pctime = 0L; // return 0 to indicate that the time is not valid
     }
  }
  return pctime;
}
