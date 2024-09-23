import 'dart:async';

// numberStream 함수를 작성하세요.
Stream<int> numberStream() {
  return Stream.periodic(const Duration(seconds: 1), (count) => count + 1)
      .take(5);
}

void main() {
  // 스트림 구독하여 숫자 출력
  Stream<int> stream = numberStream();
  stream.listen((event) {
    print('$event');
  });
}
