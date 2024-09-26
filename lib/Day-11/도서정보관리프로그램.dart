/*
도서 정보 관리 프로그램
Dart의 변수, 자료형, 반복문, 조건문, null safety, 클래스 및 sealed 클래스를 활용하여 간단한 도서 정보 관리 프로그램을 구현하세요. 이 프로그램은 여러 도서의 정보를 관리하고, 각 도서의 상세 정보를 출력합니다. 특히, 일부 도서 정보는 null 값으로 초기화될 수 있으며, 이 경우를 지시사항에 따라 적절히 처리해야 합니다.

지시사항
1. Book sealed 클래스를 정의하세요.
  - Book 클래스는 printInfo() 메서드를 갖습니다.

2. 정의한 sealed 클래스를 활용하여 책이 Ebook과 PrintedBook의 두 가지 타입을 가지도록 정의하세요.
  - Ebook은 String title과 String format을 속성으로 가집니다.
  - PrintedBook은 String title, int pages, double weight를 속성으로 가집니다.

3. 각 도서 클래스에 printInfo() 메서드를 오버라이드하여 정의하세요.
  - 각 도서 타입에 대한 출력 형식은 다음과 같습니다. ([] 부분은 각 클래스 속성의 값을 출력해야 합니다.)
  - Ebook: Ebook: [title], Format: [format]
  - PrintedBook: Printed Book: [title], Pages: [pages], Weight: [weight]

4. printBookInfo() 함수를 정의하세요.
  - 이 함수는 Book? 타입의 매개변수를 받아 해당 도서의 정보를 출력합니다.
  - 만약, 도서 정보가 null인 경우 No book information available을 출력합니다.
*/

sealed class Book {
  void printInfo();
}

class Ebook extends Book {
  final String title;
  final String format;

  Ebook(this.title, this.format);

  @override
  void printInfo() {
    print('Ebook: $title, Format: $format');
  }
}

class PrintedBook extends Book {
  final String title;
  final int pages;
  final double weight;

  PrintedBook(this.title, this.pages, this.weight);

  @override
  void printInfo() {
    print('Printed Book: $title, Pages: $pages, Weight: $weight');
  }
}

void printBookInfo(Book? book) {
  if (book != null) {
    book.printInfo();
  } else {
    print('No book information available.');
  }
}

void main() {
  List<Book?> books = [
    Ebook("Dart Programming", "PDF"),
    PrintedBook("Flutter Development", 350, 1.2),
    null,
    Ebook("Effective Dart", "EPUB"),
  ];

  for (var book in books) {
    printBookInfo(book);
  }
}
