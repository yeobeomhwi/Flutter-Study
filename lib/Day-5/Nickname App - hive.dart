import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('myBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nickname App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NicknamePage(),
    );
  }
}

class NicknamePage extends StatefulWidget {
  @override
  _NicknamePageState createState() => _NicknamePageState();
}

class _NicknamePageState extends State<NicknamePage> {
  TextEditingController _controller = TextEditingController();
  String _nickname = 'No nickname saved';
  Box? _box;

  @override
  void initState() {
    super.initState();
    _initHive();
  }

  Future<void> _initHive() async {
    _box = await Hive.openBox('myBox');
    _loadNickname();
  }

  void _loadNickname() {
    setState(() {
      _nickname = _box?.get('nickname', defaultValue: 'No nickname saved') ??
          'No nickname saved';
    });
  }

  Future<void> _saveNickname() async {
    await _box?.put('nickname', _controller.text);
    _loadNickname();
  }

  Future<void> _deleteNickname() async {
    await _box?.delete('nickname');
    _loadNickname();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nickname App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter your nickname'),
            ),
            SizedBox(height: 20),
            Text('Saved Nickname: $_nickname'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _saveNickname,
                  child: Text('Save'),
                ),
                ElevatedButton(
                  onPressed: _deleteNickname,
                  child: Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
