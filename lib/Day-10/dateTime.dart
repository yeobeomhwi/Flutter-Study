void main() {
  // 현재 날짜와 시간을 가져오는 DateTime 객체 생성
 final now = DateTime.now();

  
  // 현재 날짜를 기준으로 10일 후의 날짜를 계산
  final tenDaysLater = now.add(const Duration(days: 10));
  
  // 계산된 날짜를 아래 형식으로 출력
  print('The date 10 days from now is: $tenDaysLater');
}
