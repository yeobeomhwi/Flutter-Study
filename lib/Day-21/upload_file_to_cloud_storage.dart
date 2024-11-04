import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadFileToCloudStorage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cloud Storage Upload',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FileUploadPage(),
    );
  }
}

class FileUploadPage extends StatefulWidget {
  @override
  _FileUploadPageState createState() => _FileUploadPageState();
}

class _FileUploadPageState extends State<FileUploadPage> {
  final ImagePicker _picker = ImagePicker();
  File? _file;
  String _uploadStatus = 'No file selected';
  double _uploadProgress = 0;

  // 파일 선택 메서드
  Future<void> _pickFile() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _file = File(pickedFile.path);
        _uploadStatus = 'File selected: ${_file!.path.split('/').last}';
      });
    } else {
      setState(() {
        _uploadStatus = 'No file selected';
      });
    }
  }

  // 파일 업로드 메서드
  Future<void> _uploadFile() async {
    if (_file == null) {
      setState(() {
        _uploadStatus = 'Please select a file first';
      });
      return;
    }

    try {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('uploads/${DateTime.now().toIso8601String()}_${_file!.path.split('/').last}');
      final uploadTask = storageRef.putFile(_file!);

      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        setState(() {
          _uploadProgress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
        });
      });

      await uploadTask.whenComplete(() {
        setState(() {
          _uploadStatus = 'Upload complete';
          _uploadProgress = 100;
        });
      });
    } catch (e) {
      setState(() {
        _uploadStatus = 'Failed to upload file: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload File to Cloud Storage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              onPressed: _pickFile,
              child: Text('Pick File'),
            ),
            SizedBox(height: 20),
            if (_file != null)
              Text('Selected file: ${_file!.path.split('/').last}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadFile,
              child: Text('Upload File'),
            ),
            SizedBox(height: 20),
            Text('Status: $_uploadStatus'),
            if (_uploadProgress > 0)
              LinearProgressIndicator(value: _uploadProgress / 100),
          ],
        ),
      ),
    );
  }
}
