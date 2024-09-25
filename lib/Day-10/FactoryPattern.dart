// 추상 클래스 Animal을 작성하세요.
abstract class Animal {
  void makeSound();
}

class Dog implements Animal {
  // 여기에 코드를 작성하세요.
  @override
  void makeSound() {
    print('멍멍');
  }
}

class Cat implements Animal {
  // 여기에 코드를 작성하세요.
  @override
  void makeSound() {
    print('야옹');
  }
}

class AnimalFactory {
  static Animal createAnimal(String type) {
    // 여기에 코드를 작성하세요.
    if (type == 'dog') {
      return Dog();
    } else {
      return Cat();
    }
  }
}

void main() {
  // 여기에 코드를 작성하세요.
  var Dog = AnimalFactory.createAnimal('dog');
  Dog.makeSound();
  var Cat = AnimalFactory.createAnimal('cat');
  Cat.makeSound();
}
