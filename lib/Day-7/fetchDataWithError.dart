// fetchDataWithError 비동기 함수를 작성하세요.
Future<String> fetchDataWithError() async {
  // 2초 후에 예외를 발생
  await Future.delayed(Duration(seconds: 2));
  throw Exception("An error occurred during fetching data");
}

void main() async {
  // fetchDataWithError를 호출하고 예외를 처리
  try {
    String data = await fetchDataWithError();
    print(data);
  } catch (e) {
    print("An error occurred: $e");
  }
}
