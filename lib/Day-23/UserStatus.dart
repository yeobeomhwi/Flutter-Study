import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class UserStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserStatusScreen(),
    );
  }
}

class UserStatusScreen extends StatefulWidget {
  @override
  _UserStatusScreenState createState() => _UserStatusScreenState();
}

class _UserStatusScreenState extends State<UserStatusScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _user;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((user) {
      setState(() {
        _user = user; // 사용자 상태를 업데이트
      });
      _updateUserStatus(online: user != null); // 사용자 상태를 업데이트
    });
  }

  Future<void> _updateUserStatus({required bool online}) async {
    if (_user != null) {
      try {
        final response = await http.post(
          Uri.parse('http://10.0.2.2:5001/flutter-study-96fd6/us-central1/updateUserStatus'), // Cloud Function URL
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            'uid': _user!.uid,
            'online': online,
          }),
        );

        if (response.statusCode == 200) {
          print('User status updated successfully');
        } else {
          print('Failed to update user status: ${response.body}');
        }
      } catch (e) {
        print('Failed to update user status: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Status')),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('users').snapshots(), // Firestore에서 사용자 데이터를 가져옵니다.
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          final users = snapshot.data!.docs;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text(user['email']),
                subtitle: Text(user['status']),
                trailing: user['status'] == 'online'
                    ? Icon(Icons.circle, color: Colors.green)
                    : Icon(Icons.circle, color: Colors.red),
              );
            },
          );
        },
      ),
    );
  }
}
