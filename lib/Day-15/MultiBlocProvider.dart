import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studyfluter/Day-4/Drawer%20Navigation-StartScreen/main.dart';

// 1. 카운트 이벤트
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

//bloc 1
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<IncrementEvent>((event, emit) {
      emit(state + 1);
    });
  }
}

// 2. 메시지 이벤트
abstract class MessageEvent {}

class UpdateMessageEvent extends MessageEvent {
  final String newMessage;

  UpdateMessageEvent(this.newMessage);
}

//bloc2
class MessageBloc extends Bloc<MessageEvent, String> {
  MessageBloc() : super('Hello, World!') {
    on<UpdateMessageEvent>((event, emit) {
      emit(event.newMessage);
    });
  }
}

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
        BlocProvider<MessageBloc>(create: (context) => MessageBloc()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CounterScreen());
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MultiBlocProvider Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, int>(
              builder: (context, count) {
                return Text(
                  'Counter Value: $count',
                  style: const TextStyle(fontSize: 24),
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
            const SizedBox(height: 40),
            BlocBuilder<MessageBloc, String>(
              builder: (context, message) {
                return Text(
                  'Message: $message',
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<MessageBloc>()
                      .add(UpdateMessageEvent('Updated at ${DateTime.now()}'));
                },
                child: const Text('update Message'))
          ],
        ),
      ),
    );
  }
}
