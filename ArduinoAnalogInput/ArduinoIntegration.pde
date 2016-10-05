
import processing.serial.*;

import cc.arduino.*;


public class ArduinoIntegration implements IArduinoIntegration {
  Arduino arduino;
  
  ArduinoIntegration() {
      println(Arduino.list());
//      arduino = new Arduino(this, "/dev/tty.usbmodem621", 57600);
//      arduino = new Arduino(this, Arduino.list()[0], 57600);
  }
  
  float getVoltageFromPin(int pinNumber) {
    if (arduino == null)
      return 0;
    
    float pinValue = arduino.analogRead(pinNumber);
    float pinValueInVolts = map(pinValue,0,1024,0,5);
    return pinValueInVolts;
  }

  void setupAnalogPinAsInput(int pinNumber) {
    if (arduino != null) {
      arduino.pinMode(pinNumber, Arduino.INPUT);
    }
  }
}