// Abstract Product Interfaces
abstract class Car {
  void show();
}

abstract class Bike {
  void show();
}

// Concrete Products
class LuxuryCar implements Car {
  @override
  void show() {
    print("Luxury Car Created");
  }
}

class SportsCar implements Car {
  @override
  void show() {
    print("Sports Car Created");
  }
}

class ElectricBike implements Bike {
  @override
  void show() {
    print("Electric Bike Created");
  }
}

class SportsBike implements Bike {
  @override
  void show() {
    print("Sports Bike Created");
  }
}

// Abstract Factory
abstract class VehicleFactory {
  Car createCar();
  Bike createBike();
}

// Concrete Factories
class LuxuryVehicleFactory implements VehicleFactory {
  @override
  Car createCar() {
    return LuxuryCar();
  }

  @override
  Bike createBike() {
    return ElectricBike();
  }
}

class SportsVehicleFactory implements VehicleFactory {
  @override
  Car createCar() {
    return SportsCar();
  }

  @override
  Bike createBike() {
    return SportsBike();
  }
}

// Usage
void main() {
  VehicleFactory factory = SportsVehicleFactory();

  Car c = factory.createCar();
  c.show();

  Bike b = factory.createBike();
  b.show();
}
