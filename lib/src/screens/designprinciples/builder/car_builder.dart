class Car {
  final String engine;
  final String wheels;
  final String color;

  Car._(this.engine, this.wheels, this.color);

  void show() {
    print("Car with $engine engine, $wheels wheels, and $color color.");
  }
}

// Builder Class
class CarBuilder {
  String? _engine;
  String? _wheels;
  String? _color;

  CarBuilder setEngine(String engine) {
    _engine = engine;
    return this;
  }

  CarBuilder setWheels(String wheels) {
    _wheels = wheels;
    return this;
  }

  CarBuilder setColor(String color) {
    _color = color;
    return this;
  }

  Car build() {
    return Car._(_engine ?? "Default Engine", _wheels ?? "Default Wheels", _color ?? "Default Color");
  }
}

void main() {
  Car car = CarBuilder()
      .setEngine("V8")
      .setWheels("Alloy")
      .setColor("Red")
      .build();

  car.show();
}
