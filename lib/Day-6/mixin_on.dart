// Bird 클래스를 정의하세요.
class Bird {
  void makeSound() {
    print('새가 소리를 냅니다.');
  }
}

// Flyer 믹스인을 정의하세요.
mixin Flyer on Bird {
  void fly() {
    print('날아갑니다.');
  }
}

// Sparrow 클래스를 정의하세요.
class Sparrow extends Bird with Flyer {
  void chirp() {
    print('참새가 짹짹거립니다.');
  }
}

// Penguin 클래스를 정의하세요.
class Penguin extends Bird {
  void swim() {
    print('펭귄이 수영합니다.');
  }
}

void main() {
  // 지시사항에 따라 각 인스턴스 생성 후 메서드를 호출하세요.
  var sparrow = Sparrow();
  var penguin = Penguin();
  sparrow.makeSound();
  sparrow.fly();
  sparrow.chirp();
  penguin.makeSound();
  penguin.swim();
}
