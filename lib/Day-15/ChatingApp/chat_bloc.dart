import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final WebSocketChannel _channel;
  final List<String> _messages = [];

  ChatBloc(String url)
      : _channel = WebSocketChannel.connect(Uri.parse(url)),
        super(ChatInitial()) {
    // WebSocket에서 메시지를 수신하면 ReceiveMessageEvent를 추가
    _channel.stream.listen((message) {
      add(ReceiveMessageEvent(message));
    });

    // SendMessageEvent 처리
    on<SendMessageEvent>((event, emit) {
      _channel.sink.add(event.message);
      emit(ChatMessageSent());
    });

    // ReceiveMessageEvent 처리
    on<ReceiveMessageEvent>((event, emit) {
      _messages.add(event.message);
      emit(ChatMessageReceived(List.from(_messages)));
    });
  }

  @override
  Future<void> close() {
    _channel.sink.close();
    return super.close();
  }
}
