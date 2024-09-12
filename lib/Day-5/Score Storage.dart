import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScoreScreen(),
    );
  }
}

class ScoreScreen extends StatefulWidget {
  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  final TextEditingController _controller = TextEditingController();
  int _score = 0;

  @override
  void initState() {
    super.initState();
    _loadScore();
  }

  Future<void> _loadScore() async {
    // 여기에 저장된 점수를 불러오는 코드를 추가하세요.
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _score = prefs.getInt('score') ?? 0;
    });
  }

  Future<void> _saveScore() async {
    // 여기에 점수를 저장하는 코드를 추가하세요.
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('score', _score);
    _loadScore();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('점수가 저장되었습니다.'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Score Storage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Score: $_score',
              style: TextStyle(fontSize: 24),
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter your score'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _score = int.parse(_controller.text);
                  _saveScore();
                });
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
