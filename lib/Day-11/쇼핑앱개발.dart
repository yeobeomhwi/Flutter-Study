// 지시사항 1: ItemStatus enum을 정의하세요.
enum ItemStatus { pending, purchased, canceled }

// 지시사항 2: Item sealed class를 정의하세요.
sealed class Item {
  String name; // 아이템 이름
  int quantity; // 아이템 수량
  ItemStatus status; // 아이템 상태

  Item(this.name, this.quantity, this.status);

  // 아이템 상태를 purchased로 변경하는 메서드
  void markAsPurchased() {
    status = ItemStatus.purchased;
  }

  // 아이템 상태를 canceled로 변경하는 메서드
  void markAsCanceled() {
    status = ItemStatus.canceled;
  }
}

// 지시사항 3: GroceryItem 클래스를 정의하고 Item 클래스로부터 상속받으세요.
class GroceryItem extends Item {
  // 생성자에서 status는 기본값으로 ItemStatus.pending을 설정
  GroceryItem(String name, int quantity)
      : super(name, quantity, ItemStatus.pending);
}

// 지시사항 4: ShoppingList 클래스를 정의하고 필요한 메서드를 추가하세요.
class ShoppingList {
  final List<Item> _items = []; // 비공식 아이템 리스트

  // 아이템 리스트를 가져오는 getter
  List<Item> get items => _items;

  // 아이템을 리스트에 추가하는 메서드
  void addItem(Item item) {
    _items.add(item);
  }

  // 아이템을 리스트에서 제거하는 메서드
  void removeItem(Item item) {
    _items.remove(item);
  }

  // 상태별 아이템을 가져오는 메서드
  List<Item> getItemsByStatus(ItemStatus status) {
    return _items.where((item) => item.status == status).toList();
  }
}

// 각 아이템을 문자열로 포맷합니다.
String formatItems(List<Item> items) {
  return items
      .map((item) => '${item.name} (${item.quantity}) - ${item.status}')
      .join(', ');
}

void main() {
  ShoppingList shoppingList = ShoppingList();

  // 아이템 추가
  shoppingList.addItem(GroceryItem('Apples', 10));
  shoppingList.addItem(GroceryItem('Bread', 2));
  shoppingList.addItem(GroceryItem('Milk', 1));

  // 아이템 상태 변경
  shoppingList.items[0].markAsPurchased();
  shoppingList.items[1].markAsCanceled();

  // 각 아이템의 상태를 출력
  print(
      'Purchased Items: ${formatItems(shoppingList.getItemsByStatus(ItemStatus.purchased))}');
  print(
      'Pending Items: ${formatItems(shoppingList.getItemsByStatus(ItemStatus.pending))}');
  print(
      'Canceled Items: ${formatItems(shoppingList.getItemsByStatus(ItemStatus.canceled))}');
}
