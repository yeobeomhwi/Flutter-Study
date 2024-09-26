/*
사용자 프로필
사용자의 나이를 설정한 후 전체 프로필 정보를 출력하는 간단한 사용자 프로필 프로그램을 구현하세요.

지시사항
1. UserProfile 클래스를 정의하세요.
   - name과 email은 non-nullable String 타입으로 정의하세요.
   - age는 초기화를 지연시키는 int 타입으로 정의하세요.
   - UserProfile 생성자를 정의하세요. 생성자는 name과 email을 매개변수로 받아 초기화합니다.
2. 클래스에 setAge() 메서드를 정의하세요. 이 메서드는 int 타입의 age 값을 매개변수로 받아 사용자 나이를 설정합니다.
3. 클래스에 printProfile() 메서드를 정의하세요. 이 메서드는 사용자의 이름, 이메일, 나이를 출력합니다. 출력 형식은 다음과 같습니다.
  아래 [] 부분에는 클래스 속성의 값을 출력해야 합니다.
  Name: [이름], Email: [이메일], Age: [나이]
*/

class UserProfile {
  String? name;
  String? email;
  late int age;

  UserProfile(this.name, this.email);

  void setAge(int age) {
    this.age = age;
  }

  void printProfile() {
    print('Name: $name, Email: $email, Age: $age');
  }
}

void main() {
  UserProfile user = UserProfile('Elice', 'elice@example.com');
  user.setAge(30);
  user.printProfile();

  UserProfile user2 = UserProfile('Bob', 'chatter@example.com');
  user2.setAge(25);
  user2.printProfile();
}
