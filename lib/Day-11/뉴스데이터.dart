/* 
뉴스 데이터 가져오기
당신은 뉴스 애플리케이션을 개발하고 있습니다. 뉴스 데이터를 비동기적으로 가져와 화면에 표시하는 기능을 구현해야 합니다.

지시사항
1. fetchNews 비동기 함수를 정의하세요.

이 함수는 3초 후에 뉴스 목록을 반환합니다.
반환될 뉴스 목록은 [“News 1”, “News 2”, “News 3”]입니다.
2. displayNews 비동기 함수를 정의하세요.

이 함수는 fetchNews 함수를 호출하여 뉴스 목록을 가져옵니다.
뉴스 목록을 가져온 후 각 뉴스 아이템을 한 줄에 하나씩 출력하세요.
 */

// 지시사항 1번을 참고하여 코드를 작성하세요.
Future<List<String>> fetchNews() async {
  return await Future.delayed(Duration(seconds: 3), () {
    return ["News 1", "News 2", "News 3"];
  });
}

// 지시사항 2번을 참고하여 코드를 작성하세요.
Future<void> displayNews() async {
  List<String> newsList = await fetchNews();
  for (String news in newsList) {
    print(news);
  }
}

void main() {
  displayNews();
}
