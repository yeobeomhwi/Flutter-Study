// Logger 믹스인 정의
mixin Logger {
  void log(String message) {
    print('<LOG> $message');
  }
}

// Person 클래스 정의
class Person with Logger {
  String name;

  Person(this.name);

  void speak(String message) {
    log('Person $name says: $message');
    print('Person $name says: $message');
  }
}

// Animal 클래스 정의
class Animal with Logger {
  String type;

  Animal(this.type);

  void makeSound(String sound) {
    log('$type makes sound: $sound');
    print('$type makes sound: $sound');
  }
}

void main() {
  // Person 클래스 인스턴스 생성 및 speak 메서드 호출
  var person = Person('John');
  person.speak('Hello, how are you?');

  // Animal 클래스 인스턴스 생성 및 makeSound 메서드 호출
  var animal = Animal('Dog');
  animal.makeSound('Woof woof');
}
