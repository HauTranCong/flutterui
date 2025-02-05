class Singleton {
  Singleton._internal();

  static final Singleton _instance = Singleton._internal();

  static Singleton get instance => _instance;
}

void main() {
  var singleton1 = Singleton.instance;
  var singleton2 = Singleton.instance;

  print(singleton1 == singleton2); // true
}
