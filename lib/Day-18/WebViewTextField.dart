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
      title: 'Flutter WebView Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WebviewWithWebviewFlutterScreen(),
    );
  }
}

class WebviewWithWebviewFlutterScreen extends StatefulWidget {
  const WebviewWithWebviewFlutterScreen({super.key});

  @override
  State<WebviewWithWebviewFlutterScreen> createState() =>
      _WebviewWithWebviewFlutterScreenState();
}

class _WebviewWithWebviewFlutterScreenState
    extends State<WebviewWithWebviewFlutterScreen> {
  WebViewController? _webViewController;
  final TextEditingController _urlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://youtube.com'));
  }

  // 사용자가 입력한 URL로 이동하는 함수
  void _navigateToUrl() {
    // 코드를 작성하세요.
    String url = _urlController.text.trim();

    _webViewController?.loadRequest(Uri.parse('https://${url}'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView With WebView Flutter'),
        actions: [
          Row(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () async {
                  final messenger = ScaffoldMessenger.of(context);
                  if (await _webViewController!.canGoBack()) {
                    await _webViewController!.goBack();
                  } else {
                    messenger.showSnackBar(
                      const SnackBar(
                        duration: Duration(milliseconds: 200),
                        content: Text(
                          'Can\'t go back',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () async {
                  final messenger = ScaffoldMessenger.of(context);
                  if (await _webViewController!.canGoForward()) {
                    await _webViewController!.goForward();
                  } else {
                    messenger.showSnackBar(
                      const SnackBar(
                        duration: Duration(milliseconds: 200),
                        content: Text(
                          'No forward history item',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.replay),
                onPressed: () {
                  _webViewController!.reload();
                },
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // URL 입력 필드와 이동 버튼
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _urlController,
                    decoration: InputDecoration(
                      hintText: 'Enter a URL',
                      border: OutlineInputBorder(
                        // 사각형 모양의 테두리
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    keyboardType: TextInputType.url,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send), // 이동 아이콘 (화살표)
                  onPressed: _navigateToUrl, // 입력된 URL로 이동
                ),
              ],
            ),
          ),
          Expanded(
            child: WebViewWidget(controller: _webViewController!),
          ),
        ],
      ),
    );
  }
}
