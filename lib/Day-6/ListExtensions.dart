// ListExtensions를 생성하여 List<num> 클래스에 sum 메소드를 추가하세요.
extension ListExtensions on List<num> {
  num sum() {
    // 리스트 요소의 합을 계산하는 로직을 구현하세요.
    num total = 0;
    for (var i in this) {
      total += i;
    }
    return total;
  }
}

// 아래 코드를 수정하지 마세요.
void main() {
  List<num> numbers = [1, 2, 3, 4, 5];
  num total = numbers.sum();
  print(total);
}
