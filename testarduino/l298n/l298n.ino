/*
   OTCarTest
   A simple test program for OTCar, will make the OTCar move forward, backward,
   turn right and turn left for specific seconds.
   http://coopermaa2nd.blogspot.com/2012/09/l298n.html

   Input for motorA:
   IN1      IN2      Action
   LOW      LOW      Motor Stop
   HIGH     LOW      Motor moves forward
   LOW      HIGH     Motor moves backward
   HIGH     HIGH     Motor Stop
*/
const int motorIn1 = 5;
const int motorIn2 = 6;
const int motorIn3 = 9;
const int motorIn4 = 10;
const int DELAY = 1000;

void motorstop()
{
  digitalWrite(motorIn1, LOW);
  digitalWrite(motorIn2, LOW);
  digitalWrite(motorIn3, LOW);
  digitalWrite(motorIn4, LOW);
}

void forward()
{
  digitalWrite(motorIn1, LOW);
  digitalWrite(motorIn2, HIGH);
  digitalWrite(motorIn3, LOW);
  digitalWrite(motorIn4, HIGH);
}

void backward()
{
  digitalWrite(motorIn1, HIGH);
  digitalWrite(motorIn2, LOW);
  digitalWrite(motorIn3, HIGH);
  digitalWrite(motorIn4, LOW);
}

void left()
{
  digitalWrite(motorIn1, LOW);
  digitalWrite(motorIn2, LOW);
  digitalWrite(motorIn3, LOW);
  digitalWrite(motorIn4, HIGH);
}

void right()
{
  digitalWrite(motorIn1, LOW);
  digitalWrite(motorIn2, HIGH);
  digitalWrite(motorIn3, LOW);
  digitalWrite(motorIn4, LOW);
}

void selfTest()
{
  forward();
  delay(DELAY);
  motorstop(); delay(500);

  backward();
  delay(DELAY);
  motorstop(); delay(500);

  left();
  delay(DELAY);
  motorstop(); delay(500);

  right();
  delay(DELAY);
  motorstop(); delay(500);

  delay(4000);
}

void setup()
{
  pinMode(motorIn1, OUTPUT);
  pinMode(motorIn2, OUTPUT);
  pinMode(motorIn3, OUTPUT);
  pinMode(motorIn4, OUTPUT);
}

void loop()
{
  selfTest();
}
