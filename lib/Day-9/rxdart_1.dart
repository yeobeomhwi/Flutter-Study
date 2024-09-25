import 'package:rxdart/rxdart.dart';

// numberStream 스트림
Stream<int> numberStream() {
  return Stream.periodic(Duration(seconds: 1), (count) => count + 1).take(5);
}

void main() {
  // 지시사항을 참고하여 코드를 작성하세요.
  numberStream().listen((num) {
    print(num * num);
  });
}
