// fetchData 비동기 함수를 작성하세요.
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Data fetched - seconds: 2';
}

// processData 동기 함수를 작성하세요.
void processData() {
  print('Processing data');
}

void main() async {
  print("Start fetching data");
  // fetchData를 호출하고 결과를 기다리는 코드를 작성하세요.
  String result = await fetchData();
  // fetchData 호출 결과를 출력하는 코드를 작성하세요.
  print(result);
  // processData를 호출하는 코드를 작성하세요.
  processData();

  print("Done");
}
