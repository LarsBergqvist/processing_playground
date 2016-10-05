public class ArduinoFakeIntegration implements IArduinoIntegration {
  public float getVoltageFromPin(int pinNumber) {
    return random(0,5);
  }

  public void setupAnalogPinAsInput(int pinNumber) {
  }
}