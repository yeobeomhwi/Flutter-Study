import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class DownloadFileFromCloudStorage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cloud Storage Download',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FileDownloadPage(),
    );
  }
}

class FileDownloadPage extends StatefulWidget {
  @override
  _FileDownloadPageState createState() => _FileDownloadPageState();
}

class _FileDownloadPageState extends State<FileDownloadPage> {
  String _downloadURL = '';
  bool _isLoading = false;
  bool _hasError = false;

  Future<void> _downloadFile() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    try {
      // 파일 다운로드를 구현하세요.
      final storageRef = FirebaseStorage.instance.ref();
      final fileRef =
          storageRef.child("uploads/2024-11-01T06:28:31.239796_33.jpg");
      final appDocDir = await getApplicationDocumentsDirectory();
      final downloadFilePath =
          "${appDocDir.path}/${fileRef.name}"; //  여기에 저장한다.
      final file = File(downloadFilePath);
      await fileRef.writeToFile(file);
      final url = await fileRef.getDownloadURL();
      setState(() {
        _downloadURL = url;
      });
    } catch (e) {
      setState(() {
        _hasError = true;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Download File from Cloud Storage'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  _downloadFile();
                },
                child: Text('Download File'),
              ),
              SizedBox(height: 20),
              _isLoading
                  ? CircularProgressIndicator()
                  : _hasError
                      ? Text('Failed to download file.')
                      : _downloadURL.isNotEmpty
                          ? Image.network(_downloadURL)
                          : Text('No file downloaded yet.'),
            ],
          ),
        ),
      ),
    );
  }
}
