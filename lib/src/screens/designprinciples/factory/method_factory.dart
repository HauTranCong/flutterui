// Product Interface
abstract class Vehicle {
  void show();
}

// Concrete Products
class Car implements Vehicle {
  @override
  void show() {
    print("Car Created");
  }
}

class Bike implements Vehicle {
  @override
  void show() {
    print("Bike Created");
  }
}

// Factory Interface
abstract class VehicleFactory {
  Vehicle createVehicle();
}

// Concrete Factories
class CarFactory implements VehicleFactory {
  @override
  Vehicle createVehicle() {
    return Car();
  }
}

class BikeFactory implements VehicleFactory {
  @override
  Vehicle createVehicle() {
    return Bike();
  }
}

// Usage
void main() {
  VehicleFactory factory = CarFactory();
  Vehicle v1 = factory.createVehicle();
  v1.show();

  factory = BikeFactory();
  Vehicle v2 = factory.createVehicle();
  v2.show();
}
