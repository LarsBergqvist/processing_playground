public interface IArduinoIntegration {
  void setupAnalogPinAsInput(int pinNumber);
  float getVoltageFromPin(int pinNumber);
}