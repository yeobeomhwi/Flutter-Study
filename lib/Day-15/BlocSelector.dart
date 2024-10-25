import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterState {
  final int count;
  final String message;

  CounterState({required this.count, required this.message});
}

abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class UpdateMessageEvent extends CounterEvent {
  final String newMessage;

  UpdateMessageEvent(this.newMessage);
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(count: 0, message: 'Initial Message')) {
    on<IncrementEvent>((event, emit) {
      emit(CounterState(count: state.count + 1, message: state.message));
    });
    on<UpdateMessageEvent>((event, emit) {
      emit(CounterState(count: state.count, message: event.newMessage));
    });
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: const CounterScreen(),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BlocSelector Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocSelector<CounterBloc, CounterState, int>(
              selector: (state) => state.count,
              builder: (context, count) {
                return Text(
                  'Counter value $count',
                  style: TextStyle(fontSize: 24),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<CounterBloc>().add(IncrementEvent());
              },
              child: const Text('Increment Counter'),
            ),
            ElevatedButton(onPressed: (){
              context.read<CounterBloc>().add(UpdateMessageEvent('Updated Message!'));
            }, child: const Text('Update Message'))
          ],
        ),
      ),
    );
  }
}
