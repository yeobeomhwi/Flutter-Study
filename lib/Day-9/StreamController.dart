import 'dart:async';
import 'dart:io';

// StreamController를 생성하세요.
StreamController<String> inputStreamController = StreamController<String>();

void main() {
  // 스트림을 구독하여 입력된 문자열을 출력하는 코드를 작성하세요.
  inputStreamController.stream.listen((data) {
    print(data);
  });

  while (true) {
    String? input = stdin.readLineSync();
    if (input == null) break;
    if (input == 'exit') break;
    // 사용자의 입력(input)을 StreamController에 추가하는 코드를 작성하세요.
    inputStreamController.sink.add(input);
  }

  // 스트림을 닫는 코드를 작성하세요.
  inputStreamController.sink.close();
}
