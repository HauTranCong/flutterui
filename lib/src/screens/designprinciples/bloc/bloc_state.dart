abstract class CounterState {
  final int counterValue;
  CounterState(this.counterValue);
}

class CounterInitial extends CounterState {
  CounterInitial() : super(0);
}

class CounterUpdated extends CounterState {
  CounterUpdated(int value) : super(value);
}
