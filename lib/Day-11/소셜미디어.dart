/*
소셜 미디어 앱 개발
당신은 현재 소셜 미디어 앱을 개발 중입니다. 각 사용자는 기본적인 정보와 프로필 기능을 가지고 있으며, 관리자와 일반 사용자는 각기 다른 고유한 기능을 가집니다. Mixin과 Extension을 활용하여 이 기능들을 구현하세요.

지시사항
User라는 추상 클래스를 정의하세요.
추상 메서드 displayProfile을 선언하세요.
문자열 변수 username과 정수형 변수 age를 선언하고 초기화하는 생성자를 정의하세요.
2. CanPost와 CanDelete라는 두 개의 Mixin을 정의하세요.

CanPost는 postMessage 메서드를 구현하여 “Posting a message”를 출력하세요. (반환값, 매개변수 없음)
CanDelete는 deleteMessage 메서드를 구현하여 “Deleting a message”를 출력하세요. (반환값, 매개변수 없음)
3. Admin과 RegularUser 클래스를 정의하세요.

Admin 클래스는 User 클래스를 상속받고 CanPost와 CanDeleteMixin을 사용하세요.
RegularUser 클래스는 User 클래스를 상속받고 CanPost Mixin을 사용하세요.
각 클래스에서 displayProfile 메서드를 구현하여 사용자 이름과 나이를 아래 형식으로 출력하세요. ([이름]과 [나이] 부분은 해당 인스턴스의 이름과 나이를 출력해야 합니다.)
Admin 클래스
Admin Profile: Username - [이름], Age - [나이]
Copy
RegularUser 클래스
User Profile: Username - [이름], Age - [나이]
Copy


4. UserExtensions라는 extension을 정의하세요.

User 클래스에 sendMessage 메서드를 추가하세요. 이 메서드는 아래와 같이 출력합니다. ([이름] 부분은 해당 인스턴스의 이름을 출력해야 합니다.)
Sending a message to [이름]
 */

// 지시사항 1번을 참고하여 코드를 작성하세요.
abstract class User {
  String username;
  int age;

  User(this.username, this.age);

  void displayProfile();
}

// 지시사항 2번을 참고하여 코드를 작성하세요.
mixin CanPost {
  void postMessage() {
    print('Posting a message');
  }
}

mixin CanDelete {
  void deleteMessage() {
    print('Deleting a message');
  }
}

// 지시사항 3번을 참고하여 코드를 작성하세요.
class Admin extends User with CanPost, CanDelete {
  Admin(super.username, super.age);

  @override
  void displayProfile() {
    print('Admin Profile: Username - $username, Age - $age');
  }
}

class RegularUser extends User with CanPost {
  RegularUser(super.username, super.age);

  @override
  void displayProfile() {
    print('User Profile: Username - $username, Age - $age');
  }
}

// 지시사항 4번을 참고하여 코드를 작성하세요.
extension UserExtensions on User {
  void sendMessage() {
    print('Sending a message to $username');
  }
}

// 아래 코드를 수정하지 마세요.
void main() {
  Admin admin = Admin("Admin1", 30);
  RegularUser user = RegularUser("User1", 25);

  admin.displayProfile();
  admin.postMessage();
  admin.deleteMessage();
  admin.sendMessage();

  user.displayProfile();
  user.postMessage();
  user.sendMessage();
}
