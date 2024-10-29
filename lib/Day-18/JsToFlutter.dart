import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

var _htmlContent = '''
 <!DOCTYPE html>
 <html>
 <head>
 <title>Flutter WebView 통신</title>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <style>
 body { font-family: Arial, sans-serif; padding: 20px; }
 button { padding: 10px 20px; margin: 5px; }
 </style>
 </head>
 <body>
 <h1>Flutter WebView 통신 예제</h1>
 <button onclick="sendMessageToFlutter()">js -> Flutter로 메시지 보내기</button>

 <script>
 // Flutter로 메시지 보내기
 function sendMessageToFlutter() {
 // 'Flutter'는 Flutter 코드에서 설정한 JavaScriptChannel 이름
 Flutter.postMessage('Hello from WebView!');
 }

 // Flutter -> html 호출할 JavaScript 함수 정의
 function receiveMessageFromFlutter(message) {
 alert('Flutter에서 보낸 메시지: ' + message);
 }
 </script>
 </body>
 </html>
''';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WebViewExample(),
    );
  }
}

class WebViewExample extends StatefulWidget {
  const WebViewExample({super.key});

  @override
  State<WebViewExample> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  late final WebViewController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'Flutter',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('WebView에서 받은 메시지: ${message.message}')),
          );
        },
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            print('페이지 로드 완료: $url');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              print('유튜브 링크를 차단합니다.:: ${request.url}');
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadHtmlString(_htmlContent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView 통신 예제'),
        actions: [
          IconButton(onPressed: _sendMessageToWebView, icon: const Icon(Icons.send))
        ],
      ),
      body: WebViewWidget(controller: _controller),
    );
  }

  void _sendMessageToWebView() {
    String script = '''
    receiveMessageFromFlutter("안녕하세요, Flutter에서 보낸 메시지입니다.!");
  ''';
    _controller.runJavaScript(script);
  }
}