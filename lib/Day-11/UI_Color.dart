/*
UI 색상 코드 관리
앱 개발 시 사용할 색상 코드를 관리하는 프로그램을 구현해 보겠습니다. 이 프로그램은 여러 색상을 가지는 열거형(Enum)을 활용하여 색상별로 특정 색상 코드를 출력하는 기능을 수행합니다.

지시사항
1. 아래 값을 가진 열거형Color를 정의하세요. 
  순서대로 red, green, blue, yellow, black, white 값을 갖습니다.
2. 매개변수로 전달받은 색상에 따른 각 색상코드를 반환하는 getColorCode() 함수를 정의하세요.
  - 이 함수는 Color 타입의 매개변수를 받아 해당 색상에 따른 색상 코드(문자열)를 반환합니다.
  - 각 색상에 대한 색상 코드는 아래 색상표를 참고하세요.

색상표
red
#FF0000

green
#00FF00

blue
#0000FF

yellow
#FFFF00

black
#000000

white
#FFFFFF

이 외
Unknown color

*/
enum Color { red, green, blue, yellow, black, white }

String getColorCode(Color color) {
  switch (color) {
    case Color.red:
      return '#FF0000';
    case Color.green:
      return '#00FF00';
    case Color.blue:
      return '#0000FF';
    case Color.yellow:
      return '#FFFF00';
    case Color.black:
      return '#000000';
    case Color.white:
      return '#FFFFFF';
    default:
      return 'Unkown cloor';
  }
}

void main() {
  print('버튼 색상 코드 : ${getColorCode(Color.red)}');
  print('배경 색상 코드 : ${getColorCode(Color.green)}');
  print('텍스트 색상 코드 : ${getColorCode(Color.blue)}');
  print('헤더 색상 코드 : ${getColorCode(Color.yellow)}');
  print('푸터 색상 코드 : ${getColorCode(Color.black)}');
  print('카드 색상 코드 : ${getColorCode(Color.white)}');
}
