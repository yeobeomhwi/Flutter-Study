import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreAdd extends StatelessWidget {
  const FireStoreAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fireStoreAdd',
      home: FireStoreAddScreen(),
    );
  }
}

class FireStoreAddScreen extends StatelessWidget {
  FireStoreAddScreen({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  void addUser(String name, dynamic age) {
    final user = <String, dynamic>{"name": name, "age": age};

    FirebaseFirestore.instance
        .collection("users")
        .add(user)
        .then((DocumentReference doc) => print(' 데이터 추가 완료 ID : ${doc.id}'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add-Set'),
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
                controller: _ageController,
                decoration: const InputDecoration(labelText: "age"),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  addUser(_nameController.text, _ageController.text);
                },
                child: const Text('데이터 추가하기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
