class Singleton {
  static Singleton? _instance;

  // Private constructor
  Singleton._internal();

  // Factory constructor ensures only one instance is created
  factory Singleton() {
    return _instance ??= Singleton._internal();
  }

  void someMethod() {
    print("Singleton method called");
  }
}

void main() {
  var singleton1 = Singleton();
  var singleton2 = Singleton();

  print(singleton1 == singleton2); // true (same instance)
}
