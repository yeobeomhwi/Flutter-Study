import 'package:equatable/equatable.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class ChatMessageSent extends ChatState {}

class ChatMessageReceived extends ChatState {
  final List<String> messages;

  const ChatMessageReceived(this.messages);

  @override
  List<Object> get props => [messages];
}
