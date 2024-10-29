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
  late final WebViewController _webViewController;
  String currentUrl = "Loading...";
  String pageTitle = "Loading...";
  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setBackgroundColor(Colors.black)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) {
            return NavigationDecision.navigate; // Always navigate
          },
          onUrlChange: (UrlChange change) {
            debugPrint('URL changed to: ${change.url}');
            setState(() {
              currentUrl = change.url ?? "No URL";
            });
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
            updateTitleAndUrl(); // Update title and URL after page is fully loaded
          },
        ),
      )
      ..loadRequest(Uri.parse('https://google.com'));
  }

  // 페이지 로드가 완료될 때 URL과 제목을 업데이트하는 함수
  void updateTitleAndUrl() async {
    final newTitle = await _webViewController.getTitle();
    final newUrl = await _webViewController.currentUrl();
    setState(() {
      pageTitle = newTitle ?? "No Title";
      currentUrl = newUrl ?? "No URL";
    });
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
                  if (await _webViewController.canGoBack()) {
                    await _webViewController.goBack();
                    updateTitleAndUrl(); // Update title and URL after navigating back
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
                  if (await _webViewController.canGoForward()) {
                    await _webViewController.goForward();
                    updateTitleAndUrl(); // Update title and URL after navigating forward
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
                  _webViewController.reload();
                  updateTitleAndUrl(); // Update title and URL after reloading
                },
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Title: $pageTitle',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'URL: $currentUrl',
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Expanded(
            child: WebViewWidget(
              controller: _webViewController,
            ),
          ),
        ],
      ),
    );
  }
}
