import 'dart:async';

// StreamController를 생성하세요.
StreamController<String> eventStreamController = StreamController<String>();

void main() {
  // 스트림 구독하여 이벤트 처리 및 출력
  eventStreamController.stream.listen((data) {
    switch (data) {
      case 'start':
        print("Event: Start");
      case 'stop':
        print("Event: Stop");
      case 'pause':
        print("Event: Pause");
      default:
        print('Unknown event: $data');
    }
  });

  // StreamController에 이벤트 추가
  eventStreamController.sink.add('start');
  eventStreamController.sink.add('pause');
  eventStreamController.sink.add('stop');

  // 스트림 닫기
  eventStreamController.close();
}
