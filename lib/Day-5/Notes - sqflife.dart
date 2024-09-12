import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NoteListScreen(),
    );
  }
}

class NoteListScreen extends StatefulWidget {
  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  late Database _database;
  List<Map<String, dynamic>> _notes = [];
  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'note_database.db'),
      onCreate: (db, version) {
        return db.execute(
          // SQL 문 작성,
          'CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT)',
        );
      },
      version: 4,
    );
    _fetchNotes();
  }

  Future<void> _addNote(String title) async {
    await _database.insert(
      'notes',
      {'title': title},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    _fetchNotes();
  }

  Future<void> _deleteNote(int id) async {
    await _database.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
    _fetchNotes(); // 삭제 후 노트 목록을 갱신
  }

  Future<void> _fetchNotes() async {
    final List<Map<String, dynamic>> maps = await _database.query('notes');
    setState(() {
      _notes = maps;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          final note = _notes[index];
          return ListTile(
            title: Text(note['title']),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                _deleteNote(note['id']);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final title = await _showAddNoteDialog(context);
          if (title != null) {
            _addNote(title);
          }
        },
      ),
    );
  }

  Future<String?> _showAddNoteDialog(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (context) {
        String? title;
        return AlertDialog(
          title: Text('Add Note'),
          content: TextField(
            onChanged: (value) {
              title = value;
            },
            decoration: InputDecoration(hintText: 'Enter note title'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                Navigator.of(context).pop(title);
              },
            ),
          ],
        );
      },
    );
  }
}
