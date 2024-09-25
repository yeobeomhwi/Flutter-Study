class Observer {
  void update(String message) {}
}

class Subject {
  List<Observer> observers = [];

  void addObserver(Observer observer) {
    observers.add(observer);
  }

  void removeObserver(Observer observer) {
    observers.remove(observer);
  }

  void notifyObservers(String message) {
    for (var observer in observers) {
      observer.update(message);
    }
  }
}

class ConcreteObserver implements Observer {
  final String name;

  ConcreteObserver(this.name);
  @override
  void update(String message) {
    print('$name received message: $message');
  }
}

void main() {
  var subject = Subject();
  var observer1 = ConcreteObserver('Observer 1');
  var observer2 = ConcreteObserver('Observer 2');

  subject.addObserver(observer1);
  subject.addObserver(observer2);

  subject.notifyObservers('Hello, Observer!');
}
