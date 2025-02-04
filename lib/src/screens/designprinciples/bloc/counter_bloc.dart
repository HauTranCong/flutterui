import 'package:flutter_bloc/flutter_bloc.dart';  
import 'bloc_event.dart';
import 'bloc_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<Increment>((event, emit) => emit(CounterUpdated(state.counterValue + 1)));
    on<Decrement>((event, emit) => emit(CounterUpdated(state.counterValue - 1)));
  }
}
