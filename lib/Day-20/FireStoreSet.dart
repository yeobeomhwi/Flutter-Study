import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireStoreSet extends StatelessWidget {
  const FireStoreSet({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FireStoreSet',
      home: FireStoreSetScreen(),
    );
  }
}

class FireStoreSetScreen extends StatelessWidget {
  FireStoreSetScreen({super.key});

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  Future<void> addUserWithID(String name, String email, dynamic age) async {
    String userID = 'user_12345';
    Map<String, dynamic> userData = {
      'name': name,
      'email': email,
      'age': age,
    };

    try {
      await _firestore.collection('users').doc(userID).set(userData);
      print('데이터 추가 완료');
    } catch (e) {
      print('데이터 추가 실패 :$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FireStoreSet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: "Age"),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  addUserWithID(_nameController.text, _emailController.text,
                      _ageController.text);
                },
                child: const Text('데이터 추가'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
