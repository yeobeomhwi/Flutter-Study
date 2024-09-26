/*
주식 거래 데이터 처리
당신은 실시간으로 주식 거래 데이터를 받아와서 처리하는 애플리케이션을 개발하고 있습니다. 데이터를 비동기적으로 스트림을 통해 받아오고, 이를 처리하는 기능을 구현하세요.

지시사항
1. generateBuyOrders 비동기 스트림 함수를 정의하세요.

이 함수는 “Buy Order 1”부터 “Buy Order 5”까지의 문자열을 1초 간격으로 생성합니다.
생성된 문자열은 스트림으로 반환되어야 합니다.
2. generateSellOrders 비동기 스트림 함수를 정의하세요.

이 함수는 “Sell Order 1”부터 “Sell Order 5”까지의 문자열을 1초 간격으로 생성합니다.
생성된 문자열은 스트림으로 반환되어야 합니다.
3. generateAllOrders라는 비동기 스트림 함수를 정의하세요.

이 함수는 순서대로 generateBuyOrders와 generateSellOrders 스트림을 조합하여 모든 주문을 하나의 스트림으로 반환합니다.
yield* 키워드를 사용하여 스트림을 조합하세요.
4. main 함수에서 generateAllOrders 함수를 호출하여 모든 주문을 한 줄에 하나씩 출력하세요.
 */

import 'dart:async';

// 지시사항 1번을 참고하여 코드를 작성하세요.
Stream<String> generateBuyOrders() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield "Buy Order $i";
  }
}

// 지시사항 2번을 참고하여 코드를 작성하세요.
Stream<String> generateSellOrders() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield "Sell Order $i";
  }
}

// 지시사항 3번을 참고하여 코드를 작성하세요.
Stream<String> generateAllOrders() async* {
  yield* generateBuyOrders();
  yield* generateSellOrders();
}

// 지시사항 4번을 참고하여 코드를 작성하세요.
void main() async {
  await for (var order in generateAllOrders()) {
    print(order);
  }
}
