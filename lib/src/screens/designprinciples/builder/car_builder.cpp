#include <iostream>
#include <string>

// Product
class Car {
public:
    std::string engine;
    std::string wheels;
    std::string color;

    void show() {
        std::cout << "Car with " << engine << " engine, " 
                  << wheels << " wheels, and " 
                  << color << " color.\n";
    }
};

// Abstract Builder
class CarBuilder {
public:
    virtual CarBuilder* setEngine(const std::string& engine) = 0;
    virtual CarBuilder* setWheels(const std::string& wheels) = 0;
    virtual CarBuilder* setColor(const std::string& color) = 0;
    virtual Car build() = 0;
    virtual ~CarBuilder() = default;
};

// Concrete Builder
class ConcreteCarBuilder : public CarBuilder {
private:
    Car car;
public:
    CarBuilder* setEngine(const std::string& engine) override {
        car.engine = engine;
        return this;
    }

    CarBuilder* setWheels(const std::string& wheels) override {
        car.wheels = wheels;
        return this;
    }

    CarBuilder* setColor(const std::string& color) override {
        car.color = color;
        return this;
    }

    Car build() override {
        return car;
    }
};

// Director (Optional)
class CarDirector {
public:
    static Car buildSportsCar(CarBuilder* builder) {
        return builder->setEngine("V8")->setWheels("Alloy")->setColor("Red")->build();
    }
};

int main() {
    ConcreteCarBuilder builder;
    Car sportsCar = CarDirector::buildSportsCar(&builder);
    sportsCar.show();

    return 0;
}
