Future<void> main() async {
  print('비동기 작업을 병렬로 실행합니다.');

  //두 개의 비동기 작업을 병렬로 실행
  Future<String> task1 = fetchTask1(); //1요청
  Future<String> task2 = fetchTask2(); //2요청

  //두 작업이 완료될 때까지 기다림
  List<String> results = await Future.wait([task1, task2]);
  print('=======작업 완료 목록=======');
  for (int i = 0; i < results.length; i++) {
    print(results[i]);
  }
  print('=======finish=======');
}

Future<String> fetchTask1() async {
  await Future.delayed(Duration(seconds: 2));
  print('=======finish fetchTask1=======');
  return '작업 1 완료';
}

Future<String> fetchTask2() async {
  await Future.delayed(Duration(seconds: 4));
  print('=======finish fetchTask2=======');
  return '작업 2 완료';
}
