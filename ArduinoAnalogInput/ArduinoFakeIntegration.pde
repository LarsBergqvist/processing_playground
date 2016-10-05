public class ArduinoFakeIntegration implements IArduinoIntegration {
  float getVoltageFromPin(int pinNumber) {
    return random(0,5);
  }

  void setupAnalogPinAsInput(int pinNumber) {
  }
}