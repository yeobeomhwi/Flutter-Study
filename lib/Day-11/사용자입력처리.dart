/*
사용자 입력 처리
사용자가 입력한 데이터 리스트에서 null 값을 처리하는 프로그램을 구현하세요.
프로그램은 사용자가 입력한 정수 리스트를 받아 null 값을 0으로 대체한 새로운 리스트를 생성하고, 이를 출력합니다.
이를 통해 예상하지 못하는 사용자 입력 데이터를 안전하게 처리하고, 데이터의 무결성을 유지할 수 있습니다.

지시사항
1. removeNulls() 함수를 정의하세요.
  - 함수는 List<int?> 타입을 매개변수로 받습니다.
  - 리스트의 null 요소를 모두 제거한 새로운 리스트를 생성합니다. 이 때, null 값은 0으로 대체하여 새로운 리스트에 추가합니다.
  - null값이 0으로 대체된 새로운 리스트를 반환합니다.
*/

List<int> removeNulls(List<int?> num) {
  List<int> newList = num.map((e) => e ?? 0).toList();
  return newList;
}

void main() {
  List<int?> inputList1 = [1, 2, 3, null, 4];
  List<int?> inputList2 = [null, null, null];
  List<int?> inputList3 = [10, null, 20, null];

  List<int> result1 = removeNulls(inputList1);
  print('처리된 리스트: $result1');

  List<int> result2 = removeNulls(inputList2);
  print('처리된 리스트: $result2');

  List<int> result3 = removeNulls(inputList3);
  print('처리된 리스트: $result3');
}
