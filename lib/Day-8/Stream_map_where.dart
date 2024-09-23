import 'dart:async';

Stream<int> generateNumbers() {
  // 여기에 코드를 작성하세요.
  return Stream.periodic(const Duration(seconds: 1), (count) => count + 1)
      .take(10);
}

void main() {
  // 여기에 코드를 작성하세요.
  generateNumbers()
      .where((num) => num.isEven)
      .map((num) => num * num)
      .listen((num) {
    print(num);
  });
}
