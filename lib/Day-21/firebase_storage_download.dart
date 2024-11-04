import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FirebaseStorageDownload extends StatelessWidget {
  const FirebaseStorageDownload({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Storage Download',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DownloadPage(),
    );
  }
}

class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  DownloadTask? _downloadTask;
  UploadTask? _uploadTask;

  double _uploadProgress = 0.0;
  double _downloadProgress = 0.0;
  String _downloadedFilePath = ' ';

  Future<void> _downloadFile() async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final fileRef = storageRef.child("images/mountains.jpg"); // 이파일을
      final appDocDir = await getApplicationDocumentsDirectory();
      final downloadFilePath =
          "${appDocDir.path}/downloaded_mountains.jpg"; //  여기에 저장한다.
      final file = File(downloadFilePath);

      setState(() {
        _downloadedFilePath = downloadFilePath;
        _downloadTask = fileRef.writeToFile(file);
      });

      _downloadTask!.snapshotEvents.listen((TaskSnapshot snapshot) {
        switch (snapshot.state) {
          case TaskState.running:
            setState(() {
              _downloadProgress =
                  100.0 * (snapshot.bytesTransferred / snapshot.totalBytes);
            });
            print("Download is $_downloadProgress% complete.");
            break;
          case TaskState.paused:
            print("Download is paused.");
            break;
          case TaskState.canceled:
            print("Download was canceled.");
            break;
          case TaskState.error:
            print("Download failed.");
            break;
          case TaskState.success:
            print("Download completed successfully.");
            break;
        }
      });
    } catch (e) {
      print("Error downloading file: $e");
    }
  }

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
              _uploadProgress =
                  100.0 * (snapshot.bytesTransferred / snapshot.totalBytes);
            });
            print("Upload is $_uploadProgress% complete.");
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
        title: Text('Firebase Storage Upload & Download'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_uploadTask != null)
              LinearProgressIndicator(value: _uploadProgress / 100),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _uploadFile();
              },
              child: Text("Upload File"),
            ),
            if (_uploadTask != null)
              Text("Upload Progress: ${_uploadProgress.toStringAsFixed(2)}%"),
            SizedBox(height: 32),
            if (_downloadTask != null)
              LinearProgressIndicator(value: _downloadProgress / 100),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _downloadFile();
              },
              child: Text("Download File"),
            ),
            if (_downloadTask != null)
              Text(
                  "Download Progress: ${_downloadProgress.toStringAsFixed(2)}%"),
            SizedBox(height: 16),
            if (_downloadedFilePath.isNotEmpty)
              Text("Downloaded to :$_downloadedFilePath"),
          ],
        ),
      ),
    );
  }
}
