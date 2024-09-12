import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.openBox('notes'); // 'notes' 박스 열기
  runApp(MyApp());
}

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
  late Box _notesBox;

  @override
  void initState() {
    super.initState();
    _initializeHive();
  }

  Future<void> _initializeHive() async {
    // TODO: Hive 초기화 및 'notes' 박스 열기
    _notesBox = Hive.box('notes'); // 'notes' 박스를 _notesBox 변수에 저장
    setState(() {}); // 상태 업데이트
  }

  Future<void> _addNote(String title, String content) async {
    // TODO: 새로운 메모 항목 추가
    await _notesBox.add({'title': title, 'content': content}); // 노트 추가
    setState(() {}); // 상태 업데이트
  }

  Future<void> _fetchNotes() async {
    // TODO: 모든 메모 항목 조회
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: FutureBuilder(
        future: _fetchNotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: _notesBox.length,
            itemBuilder: (context, index) {
              final note = _notesBox.getAt(index);
              return ListTile(
                title: Text(note['title']),
                subtitle: Text(note['content']),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final result = await _showAddNoteDialog(context);
          if (result != null) {
            _addNote(result['title']!, result['content']!);
          }
        },
      ),
    );
  }

  Future<Map<String, String>?> _showAddNoteDialog(BuildContext context) {
    String? title;
    String? content;
    return showDialog<Map<String, String>>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Note'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  title = value;
                },
                decoration: InputDecoration(hintText: 'Enter note title'),
              ),
              TextField(
                onChanged: (value) {
                  content = value;
                },
                decoration: InputDecoration(hintText: 'Enter note content'),
              ),
            ],
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
                Navigator.of(context)
                    .pop({'title': title!, 'content': content!});
              },
            ),
          ],
        );
      },
    );
  }
}
