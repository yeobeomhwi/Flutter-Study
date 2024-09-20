// 지시사항을 참고하여 코드를 작성하세요.
class Storage<T> {
  List<T> _items = [];

  void addItem(T item) {
    _items.add(item);
  }

  T getItem(int index) {
    return _items[index];
  }

  int get length => _items.length;
}

// 아래 코드를 수정하지 마세요.
void main() {
  Storage<int> intStorage = Storage<int>();
  intStorage.addItem(10);
  intStorage.addItem(20);
  intStorage.addItem(30);
  print(
      '정수 저장소 아이템: ${intStorage.getItem(0)}, ${intStorage.getItem(1)}, ${intStorage.getItem(2)}');
  print('정수 저장소 길이: ${intStorage.length}');

  Storage<String> stringStorage = Storage<String>();
  stringStorage.addItem('Hello');
  stringStorage.addItem('World');
  print(
      '문자열 저장소 아이템: ${stringStorage.getItem(0)}, ${stringStorage.getItem(1)}');
  print('문자열 저장소 길이: ${stringStorage.length}');
}
