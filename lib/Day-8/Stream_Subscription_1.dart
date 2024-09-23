import 'dart:async';

Stream<int> generateNumbers() {
  // 여기에 코드를 작성하세요.
  return Stream.periodic(const Duration(seconds: 1), (count) => count + 1)
      .take(10);
}

void main() {
  // 여기에 코드를 작성하세요.
  StreamSubscription<int> subscr;

  subscr = generateNumbers().listen((num) {
    print('$num');
  });

  Future.delayed(const Duration(seconds: 5), () {
    subscr.pause();
    print('구독 일시 중지');

    Future.delayed(const Duration(seconds: 3), () {
      subscr.resume();
      print('구독 재개');
    });
  });
}
