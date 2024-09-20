// StringExtensions를 생성하여 String 클래스에 countOccurrences 메서드를 추가하세요.
extension StringExtensions on String {
  int countOccurrences(String char) {
    // 특정 문자의 개수를 세서 반환하는 로직을 구현하세요.
    int count = 0;
    for (int i = 0; i < this.length; i++) {
      if (this[i] == char) {
        count++;
      }
    }
    return count;
  }
}

// 아래 코드를 수정하지 마세요.
void main() {
  String testString = "hello world";
  int count = testString.countOccurrences("l");
  print(count);
}
