// Animal 클래스를 정의하세요.
class Animal {}

// CatSound 믹스인을 정의하세요.
mixin CatSound {
  void makeSound() {
    print("Meow");
  }
}
// DogSound 믹스인을 정의하세요.
mixin DogSound {
  void makeSound() {
    print("Woof");
  }
}

// Cat 클래스를 정의하세요.
class Cat extends Animal with CatSound {}

// Dog 클래스를 정의하세요.
class Dog extends Animal with DogSound {}

void main() {
  Cat myCat = Cat();
  Dog myDog = Dog();

  // Cat의 makeSound 호출
  myCat.makeSound();

  // Dog의 makeSound 호출
  myDog.makeSound();
}
