void main() async {
  print('주문을 받습니다.'); //1
  await prepareFoodAsync(); //2
  print('음식을 제공합니다.'); //3
}

Future<void> prepareFoodAsync() async {
  print('음식을 준비합니다.');
  await Future.delayed(Duration(seconds: 3)); //음식준비에 3초가 걸린다 가정
  print('음식 준비 완료');
}
