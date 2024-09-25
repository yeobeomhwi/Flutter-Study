import 'package:rxdart/rxdart.dart';

// evenStream 스트림 생성
Stream<int> evenStream() {
  return Stream.periodic(
      Duration(milliseconds: 500), (count) => (count + 1) * 2).take(5);
}

// oddStream 스트림 생성
Stream<int> oddStream() {
  return Stream.periodic(Duration(milliseconds: 500), (count) => count * 2 + 1)
      .take(5);
}

void main() {
  Rx.merge([oddStream(), evenStream()]).listen((Data) {
    if (Data % 2 != 0) {
      print('Odd: $Data');
    } else {
      print('Even: $Data');
    }
  });
}
