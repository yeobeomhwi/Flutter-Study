import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> example() async {
  //async = 비동기 작업을 수행할것을 나타냄
  //await = 비동기 작업이 완료될 때까지 함수의 실행을 멈추고, 완료되면 다음라인 실행
  SharedPreferences prefs = await SharedPreferences.getInstance();
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Name Storage',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  String _nickname = 'No nickname saved';

  @override
  void initState() {
    super.initState();
    _loadNickname();
  }

  Future<void> _loadNickname() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nickname = prefs.getString('nickname') ?? 'No nickname saved';
    });
  }

  Future<void> _saveNickname() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nickname', _controller.text);
    _loadNickname();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('닉네임이 저장되었습니다.'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  Future<void> _deleteNickname() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('nickname');
    _loadNickname();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('닉네임이 삭제되었습니다.'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nickname App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello, $_nickname',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter your nickname',
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: (_saveNickname),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
