unsigned long mtime;

int sensorPin0 = A0;    // select the input pin for the potentiometer
int sensorPin1 = A1;
int sensorPin2 = A2;
int sensorPin3 = A3;
/*
int sensorPin4 = A4;
int sensorPin5 = A5;
int sensorPin6 = A6;
int sensorPin7 = A7;
*/
int sensorPin4 = A12;
int sensorPin5 = A13;
int sensorPin6 = A14;
int sensorPin7 = A15;


int sensorValue0 = 0;  // variable to store the value coming from the sensor
int sensorValue1 = 0;
int sensorValue2 = 0;
int sensorValue3 = 0;
int sensorValue4 = 0;
int sensorValue5 = 0;
int sensorValue6 = 0;
int sensorValue7 = 0;
 
void setup() {
  // begin the serial monitor @ 9600 baud
  Serial.begin(9600);
}
 
void loop() {
  mtime = millis();
  // read the value from the sensor:
  sensorValue0 = analogRead(sensorPin0);
  sensorValue1 = analogRead(sensorPin1);
  sensorValue2 = analogRead(sensorPin2);
  sensorValue3 = analogRead(sensorPin3);
  sensorValue4 = analogRead(sensorPin4);
  sensorValue5 = analogRead(sensorPin5);
  sensorValue6 = analogRead(sensorPin6);
  sensorValue7 = analogRead(sensorPin7);

  Serial.print(sensorValue0);
  Serial.print(",");
  Serial.print(sensorValue1);
  Serial.print(",");
  Serial.print(sensorValue2);
  Serial.print(",");
  Serial.print(sensorValue3);
  Serial.print(",");
  Serial.print(sensorValue4);
  Serial.print(",");
  Serial.print(sensorValue5);
  Serial.print(",");
  Serial.print(sensorValue6);
  Serial.print(",");
  Serial.println(sensorValue7);
 
  while (millis() - mtime < 100) {
    continue;
  }
}
