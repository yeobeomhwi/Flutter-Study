import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Nickname App',
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
        title: const Text('Name Storage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter your nickname',
              ),
            ),
            const SizedBox(height: 20),
            Text('Saved Nickname: $_nickname'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: (_saveNickname),
                  child: const Text('Save'),
                ),
                ElevatedButton(
                  onPressed: (_deleteNickname),
                  child: const Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
