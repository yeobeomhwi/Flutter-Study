import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebView Scroll Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WebviewWithScroll(),
    );
  }
}

class WebviewWithScroll extends StatefulWidget {
  const WebviewWithScroll({super.key});

  @override
  State<WebviewWithScroll> createState() =>
      _WebviewWithWebviewFlutterScreenState();
}

class _WebviewWithWebviewFlutterScreenState extends State<WebviewWithScroll> {
  late final WebViewController _webViewController;
  double _scrollX = 0;
  double _scrollY = 0;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setOnScrollPositionChange((position) {
        setState(() {
          _scrollX = position.x;
          _scrollY = position.y;
        });
        debugPrint("Scroll Position: X: ${position.x}, Y: ${position.y}");
      })
      ..loadRequest(Uri.parse('https://flutter.dev'));
  }

  // 맨 상단으로 스크롤하는 함수
  void _scrollToTop() async {
    await _webViewController.runJavaScript("window.scrollTo(0, 0);");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView Scroll Example'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Scroll Position - X: $_scrollX, Y: $_scrollY',
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: WebViewWidget(controller: _webViewController),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scrollToTop,
        child: const Icon(Icons.arrow_upward), // 상단으로 스크롤하는 아이콘
      ),
    );
  }
}
