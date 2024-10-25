import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chat_bloc.dart';
import 'chat_event.dart';
import 'chat_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      home: BlocProvider(
        create: (context) => ChatBloc('ws://echo.websocket.org'),
        child: ChatScreen(),
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat Room")),
      body: Column(
        children: <Widget>[
          Expanded(
            child: BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                if (state is ChatMessageReceived && state.messages.isNotEmpty) {
                  return ListView.builder(
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.messages[index]),
                      );
                    },
                  );
                }
                return const Center(child: Text('No messages yet.'));
              },
            ),
          ),
          BlocListener<ChatBloc, ChatState>(
            listener: (context, state) {
              if (state is ChatMessageSent) {
                _controller.clear();
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Enter your message...',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        // TODO: Implement the SendMessageEvent method
                        context.read<ChatBloc>().add(SendMessageEvent(_controller.text));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
