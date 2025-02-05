class Singleton {
  static Singleton? _instance;
  static final Object _lock = Object();

  Singleton._internal();

  factory Singleton() {
    if (_instance == null) {
      // Ensures only one instance is created
      synchronized(_lock, () {
        _instance ??= Singleton._internal();
      });
    }
    return _instance!;
  }
}

// Synchronized helper function
void synchronized(Object lock, Function() action) {
  // In actual Dart isolate-based concurrency, use proper locks.
  action();
}
