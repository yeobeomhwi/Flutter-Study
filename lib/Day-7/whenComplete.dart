import 'dart:math';
import 'dart:async';

// loadData 비동기 함수를 작성하세요.
Future<String> loadData() {
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
  loadData().then((result) {
    print(result);
  }).catchError((error) {
    print(error);
  }).whenComplete(() {
    print('작업완료');
  });
}
