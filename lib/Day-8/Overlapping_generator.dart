// generateEvenNumbers 제너레이터 함수를 작성하세요.
Iterable<int> generateEvenNumbers() sync* {
  // 2, 4, 6을 yield 사용하여 생성
  for (int i = 1; i <= 3; i++) {
    yield i * 2;
  }
}

// generateOddNumbers 제너레이터 함수를 작성하세요.
Iterable<int> generateOddNumbers() sync* {
  // 1, 3, 5를 yield 사용하여 생성
  for (int i = 1; i <= 5; i++) {
    if (i % 2 == 1) {
      yield i;
    }
  }
}

// generateNumbers 제너레이터 함수를 작성하세요.
Iterable<int> generateNumbers() sync* {
  // yield* 사용하여 짝수와 홀수를 모두 생성
  yield* generateEvenNumbers();
  yield* generateOddNumbers();
}

void main() {
  // 제너레이터 함수 호출하여 숫자 출력
  Iterable<int> numbers = generateNumbers();

  for (int num in numbers) {
    print(num);
  }
}
