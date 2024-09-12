import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nickname App - Sqflite',
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
  Database? _database;

  @override
  void initState() {
    super.initState();
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'nickname.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE nicknames(id INTEGER PRIMARY KEY, name TEXT)',
        );
      },
      version: 1,
    );
    _loadNickname();
  }

  Future<void> _loadNickname() async {
    final List<Map<String, dynamic>> maps = await _database!.query('nicknames');
    if (maps.isNotEmpty) {
      setState(() {
        _nickname = maps.last['name'];
      });
    } else {
      setState(() {
        _nickname = 'No nickname saved';
      });
    }
  }

  Future<void> _saveNickname() async {
    await _database!.insert(
      'nicknames',
      {'name': _controller.text},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    _loadNickname();
  }

  Future<void> _deleteNickname() async {
    await _database!.delete('nicknames');
    _loadNickname();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nickname App - Sqflite'),
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
