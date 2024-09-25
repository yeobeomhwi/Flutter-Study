void main() {
  // 주어진 URL 문자열
  String urlString = "https://www.example.com/path/to/resource?name=Dart&version=2.10";
  
  // URL 문자열을 Uri 객체로 파싱
  final uri = Uri.parse(urlString);

  // 호스트, 경로, 쿼리 매개변수 추출
  final Host = uri.host;
  final Path = uri.path;
  final Query = uri.queryParameters;

  // 추출한 정보 출력
  print('Host: $Host');
  print('Path: $Path');
  print('Query parameters: $Query');  
}
