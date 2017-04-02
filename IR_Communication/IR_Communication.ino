#include <morse.h>

#define PIN_STATUS 32

LEDMorseSender sender(PIN_STATUS);

void setup() {
  sender.setup();
  sender.setMessage(String("hello world"));

  sender.setWPM(4);

  pinMode(A12, INPUT);      // Connected to IR Sensor #1
  pinMode(A15, INPUT);      // Connected to IR Sensor #2

  pinMode(A16, OUTPUT);     // Connected to LED corresponding to #1
  pinMode(A17, OUTPUT);     // Connected to LED corresponding to #2

}

void loop() {
  int val1;
  int val2;

  if (!sender.continueSending())  {
    sender.startSending();
  }

  val1 = analogRead(A12);
  val2 = analogRead(A15);

  if (val1 >= 25) {
    val1 = val1 * 200;
  }
  else  {
    val1 = 0;
  }

  if (val2 >= 50) {
    val2 = val2 * 200;
  }
  else  {
    val2 = 0;
  }

  analogWrite(A16, val1);
  analogWrite(A17, val2);

}
