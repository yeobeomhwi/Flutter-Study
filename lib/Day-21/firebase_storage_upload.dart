// lib/main.dart
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FirebaseStorageUpload extends StatelessWidget {
  const FirebaseStorageUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Storage Upload',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UploadPage(),
    );
  }
}

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  UploadTask? _uploadTask;
  double _progress = 0.0;

  Future<void> _uploadFile() async {
    try {
      // 로컬 파일 경로 가져오기
      /**
          ex) 플랫폼별 패키지내의 경로
          Android: /data/user/0/com.example.yourapp/app_flutter/mountains.jpg
          iOS: ~/Documents/mountains.jpg
       */
      final appDocDir = await getApplicationDocumentsDirectory();
      print(appDocDir);
      final filePath = "${appDocDir.path}/2222.jpg"; //티니핑 이미지 파일
      final file = File(filePath);
      // 파일이 존재하는지 확인
      if (!file.existsSync()) {
        print("Error: File does not exist.");
        return;
      }
      // 파일 메타데이터 설정
      final metadata = SettableMetadata(contentType: "image/jpeg");
      // Firebase Storage 참조 생성
      final storageRef = FirebaseStorage.instance.ref();
      final fileRef = storageRef.child("images/mountains.jpg"); //이 경로에 업로드 할것.
      // 업로드 시작
      setState(() {
        _uploadTask = fileRef.putFile(file, metadata);
      });
      // 업로드 진행 상황 모니터링
      _uploadTask!.snapshotEvents.listen((TaskSnapshot snapshot) {
        switch (snapshot.state) {
          case TaskState.running:
            setState(() {
              _progress =
                  100.0 * (snapshot.bytesTransferred / snapshot.totalBytes);
            });
            print("Upload is $_progress% complete.");
            break;
          case TaskState.paused:
            print("Upload is paused.");
            break;
          case TaskState.canceled:
            print("Upload was canceled.");
            break;
          case TaskState.error:
            print("Upload failed.");
            break;
          case TaskState.success:
            print("Upload completed successfully.");
            break;
        }
      });
    } catch (e) {
      print("Error uploading file: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Storage Upload"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //프로그레스바 표시
            if (_uploadTask != null)
              LinearProgressIndicator(value: _progress / 100),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _uploadFile,
              child: Text("Upload File"),
            ),
            if (_uploadTask != null)
              Text("Upload progress: ${_progress.toStringAsFixed(2)}%"),
          ],
        ),
      ),
    );
  }
}
