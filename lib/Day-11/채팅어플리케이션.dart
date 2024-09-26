/*
채팅 애플리케이션 개발
당신은 실시간 채팅 애플리케이션을 개발하고 있습니다. 사용자가 입력한 채팅 메시지를 스트림을 통해 처리하고, 화면에 표시하는 기능을 구현하세요.

지시사항
chatController라는 이름의 스트림 컨트롤러를 생성하세요.
2. sendMessage 함수를 정의하여 매개변수로 전달받은 문자열을 chatController에 추가하세요.

3. listenToMessages 함수를 정의하여 chatController의 스트림을 구독하고, 새로운 메시지가 도착할 때마다 아래의 형식으로 출력하세요. ([메시지] 부분에 메시지를 출력합니다.)

New message: [메시지]
 */

import 'dart:async';

// 지시사항 1번을 참고하여 코드를 작성하세요.
StreamController<String> chatController = StreamController<String>();

// 지시사항 2번을 참고하여 코드를 작성하세요.
void sendMessage(String message) {
  chatController.add(message);
}

// 지시사항 3번을 참고하여 코드를 작성하세요.
void listenToMessages() {
  chatController.stream.listen((message) {
    print('New message: $message');
  });
}

// 아래 코드를 수정하지 마세요.
void main() {
  listenToMessages();

  sendMessage('Hello, world!');
  sendMessage('How are you?');
  sendMessage('This is a chat message.');

  chatController.close();
}
