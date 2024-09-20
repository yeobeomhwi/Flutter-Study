import 'dart:math';
import 'dart:async';

// fetchData 함수를 작성하세요.
Future<String> fetchData() {
  return Future.delayed(Duration(seconds: 2), () {
    Random random = Random();

    if (random.nextBool()) {
      return '데이터 로드 완료';
    } else {
      throw '데이터 로드 실패';
    }
  });
}

void main() {
  // 여기에 코드를 작성하세요.
  fetchData().then((result) {
    print(result);
  }).catchError((error) {
    print(error);
  });
}
