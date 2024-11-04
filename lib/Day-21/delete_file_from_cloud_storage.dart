import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class DeleteFileFromCloudStorage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cloud Storage Delete',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FileDeletePage(),
    );
  }
}

class FileDeletePage extends StatefulWidget {
  @override
  _FileDeletePageState createState() => _FileDeletePageState();
}

class _FileDeletePageState extends State<FileDeletePage> {
  String _fileName = '';
  String _statusMessage = '';
  bool _isDeleting = false;
  bool _hasError = false;

  Future<void> _selectFile() async {
    // 파일 선택을 구현하세요.
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _fileName = result.files.single.name;
        _statusMessage = 'File selected: ${_fileName}';
      });
    }
  }

  Future<void> _deleteFile() async {
    if (_fileName.isEmpty) {
      setState(() {
        _statusMessage = 'No file selected.';
      });
      return;
    }

    setState(() {
      _isDeleting = true;
      _hasError = false;
    });

    try {
      // 파일 삭제를 구현하세요.
      final storageRef = FirebaseStorage.instance.ref();
      final fileRef = storageRef.child('uploads/$_fileName'); // 파일 경로 설정

      await fileRef.delete();

      setState(() {
        _statusMessage = 'File deleted successfully.';
        _fileName = '';
      });
    } catch (e) {
      setState(() {
        _statusMessage = 'Failed to delete file: $e';
        _hasError = true;
      });
    } finally {
      setState(() {
        _isDeleting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete File from Cloud Storage'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _selectFile,
                child: Text('Select File'),
              ),
              SizedBox(height: 20),
              Text(_statusMessage),
              if (_fileName.isNotEmpty)
                Text('Selected file: $_fileName'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _deleteFile,
                child: Text('Delete File'),
              ),
              if (_isDeleting)
                CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
