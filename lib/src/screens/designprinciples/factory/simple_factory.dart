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

// Factory Class
class VehicleFactory {
  static Vehicle createVehicle(String type) {
    if (type == "car") return Car();
    if (type == "bike") return Bike();
    throw Exception("Invalid vehicle type");
  }
}

// Usage
void main() {
  Vehicle v1 = VehicleFactory.createVehicle("car");
  v1.show();

  Vehicle v2 = VehicleFactory.createVehicle("bike");
  v2.show();
}
