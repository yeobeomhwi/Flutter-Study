void main() {
  // 학생 이름과 점수의 맵
  Map<String, int> scores = {
    'Alice': 85,
    'Bob': 92,
    'Charlie': 78,
    'David': 90,
  };

  // 모든 학생의 점수 평균 계산
  double avg = scores.values.reduce((a,b) => a+ b) / scores.length;

  // 계산된 평균 점수 출력
  print('Average score: $avg');
}
