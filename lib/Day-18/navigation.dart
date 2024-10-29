import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(const MyApp());

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
      ..loadRequest(Uri.parse('https://flutter.dev'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView Example'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    if (await _controller.canGoBack()) {
                      _controller.goBack();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('안됩니다...')),
                      );
                    }
                  },
                  child: const Text('이전')),
              ElevatedButton(
                  onPressed: () async {
                    if (await _controller.canGoForward()) {
                      _controller.goForward();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('안됩니다...')),
                      );
                    }
                  },
                  child: Text('다음')),
            ],
          ),
          Expanded(child: WebViewWidget(controller: _controller))
        ],
      ),
    );
  }
}
