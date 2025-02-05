class Singleton {
  static final Singleton _instance = Singleton._internal();

  // Private constructor
  Singleton._internal();

  factory Singleton() {
    return _instance;
  }
}

void main() {
  var singleton1 = Singleton();
  var singleton2 = Singleton();

  print(singleton1 == singleton2); // true (same instance)
}
