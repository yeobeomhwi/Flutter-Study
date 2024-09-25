abstract class Coffee {
  String getDescription();
  double getCost();
}

class SimpleCoffee implements Coffee {
  @override
  String getDescription() {
    return "Simple Coffee";
  }

  @override
  double getCost() {
    return 5.0;
  }
}

class MilkDecorator implements Coffee {
  final Coffee coffee;
  MilkDecorator(this.coffee);

  @override
  String getDescription() {
    return "${coffee.getDescription()}, with milk";
  }

  @override
  double getCost() {
    return coffee.getCost() + 1.5;
  }
}

class SugarDecorator implements Coffee {
  final Coffee coffee;
  SugarDecorator(this.coffee);

  @override
  String getDescription() {
    return "${coffee.getDescription()}, with sugar";
  }

  @override
  double getCost() {
    return coffee.getCost() + 0.5;
  }
}

void main() {
  Coffee coffee = SimpleCoffee();
  print(
      'Original coffee = ${coffee.getDescription()} / cost:${coffee.getCost()}');
  coffee = MilkDecorator(coffee);
  print('add milk = ${coffee.getDescription()} / cost:${coffee.getCost()}');
  coffee = SugarDecorator(coffee);
  print('add sugar = ${coffee.getDescription()} / cost:${coffee.getCost()}');
}
