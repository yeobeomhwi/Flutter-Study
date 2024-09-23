// generateNumbers 제너레이터 함수를 작성하세요.
Iterable<int> generateNumbers(int max) sync* {
  // 1부터 5까지의 숫자를 yield 사용하여 생성
  for (int i = 1; i <= max; i++) {
    yield i;
  }
}

void main() {
  // 제너레이터 함수 호출하여 숫자 출력
  Iterable<int> numbers = generateNumbers(5);

  for (int num in numbers) {
    print(num);
  }
}
