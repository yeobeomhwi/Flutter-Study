// task1 비동기 함수를 작성하세요.
Future<String> task1() async {
  await Future.delayed(Duration(seconds: 3));
  return 'Task 1 complete';
}

Future<String> task2() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Task 2 complete';
}

// task2 비동기 함수를 작성하세요.

void main() async {
  print("Starting tasks");
  // task1과 task2를 병렬로 실행하고, 두 작업이 완료된 후 결과를 출력
  Future<String> taskM1 = task1();
  Future<String> taskM2 = task2();
  List<String> result = await Future.wait([taskM1, taskM2]);
  for (int i = 0; i < result.length; i++) {
    print(result[i]);
  }

  print("All tasks complete");
}
