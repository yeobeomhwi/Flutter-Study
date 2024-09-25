class Logger {
  // 싱글톤 인스턴스를 저장할 변수
  static Logger? _instance;

  Logger._internal();

  // 싱글톤 인스턴스를 반환하는 메서드
  static Logger get instance {
    if (_instance == null) {
      _instance = Logger._internal();
    }
    return _instance!;
  }

  void log(String message) {
    print('LOG: $message');
  }
}

void main() {
  Logger logger1 = Logger.instance;
  Logger logger2 = Logger.instance;

  logger1.log("첫 번째 메시지");
  logger2.log("두 번째 메시지");

  print(logger1 == logger2);
}