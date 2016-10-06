import processing.core.PApplet;
import processing.serial.*;
import cc.arduino.*;

public class ArduinoIntegration implements IArduinoIntegration {

  // Change this so that it matches the usb device connected to the Arduino
  String arduinoUSBDeviceName = "/dev/tty.usbmodem1421";

  Arduino arduino;
  
  ArduinoIntegration(PApplet applet) {
      try {
        arduino = new Arduino(applet, arduinoUSBDeviceName , 57600);
      }
      catch(Exception e) {
        println(e.getMessage());
      }
  }
  
  public float getVoltageFromPin(int pinNumber) {
    if (arduino == null)
      return 0;
    
    float pinValue = arduino.analogRead(pinNumber);
    float pinValueInVolts = map(pinValue,0,1024,0,5);
    return pinValueInVolts;
  }

  public void setupAnalogPinAsInput(int pinNumber) {
    if (arduino != null) {
      arduino.pinMode(pinNumber, Arduino.INPUT);
    }
  }
}
