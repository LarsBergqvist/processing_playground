public interface IArduinoIntegration {
  void setupDigitalPinAsOutput(int pinNumber);
  void setState(int pinNumber, int state);
}