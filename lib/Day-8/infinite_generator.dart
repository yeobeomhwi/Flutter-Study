// generateInfiniteNumbers 제너레이터 함수를 작성하세요.
Iterable<int> generateInfiniteNumbers() sync* {
  // 1부터 시작하여 무한히 증가하는 숫자를 yield 사용하여 생성
  int i = 1;
  while (true) {
    yield i++; // 현재 숫자를 반환하고, i를 증가시킴
  }
}

void main() {
  // 제너레이터 함수 호출하여 숫자 리스트를 생성
  Iterable<int> numbers = generateInfiniteNumbers();

  for (int num in numbers) {
    if (num <= 10) {
      print(num);
    } else {
      break;
    }
  }
}
