// Swimmer 믹스인을 정의하세요.
mixin Swimmer {
  void swim() {
    print('Swimming');
  }
}

// Flyer 믹스인을 정의하세요.
mixin Flyer {
  void fly() {
    print('Flying');
  }
}

// Duck 클래스를 정의하세요.
class Duck with Swimmer, Flyer {}

// Penguin 클래스를 정의하세요.
class Penguin with Swimmer {}

void main() {
  Duck myDuck = Duck();
  Penguin myPenguin = Penguin();

  // Duck의 swim과 fly 호출
  myDuck.swim();
  myDuck.fly();
  // Penguin의 swim 호출
  myPenguin.swim();
}
