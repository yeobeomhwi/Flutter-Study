void main() {
  // 주어진 정수 리스트
  List<int> numbers = [5, 3, 8, 1, 2];

  // 리스트 오름차순 정렬
  numbers.sort();

  // 정렬된 리스트의 각 요소를 문자열로 변환
  numbers.toString();
  // 변환된 리스트 출력
  print('Sorted and converted list: $numbers');
}
