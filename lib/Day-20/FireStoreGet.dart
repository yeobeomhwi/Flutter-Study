import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireStoreGet extends StatelessWidget {
  const FireStoreGet({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'FireStoreGet',
      home: FireStoreGetScreen(),
    );
  }
}

class FireStoreGetScreen extends StatelessWidget {
  const FireStoreGetScreen({super.key});

  void fetchData() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    QuerySnapshot querySnapshot = await users.get();
    for (var doc in querySnapshot.docs) {
      print('${doc.id} => ${doc.data()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FireStoreGet"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                fetchData();
              },
              child: const Text("Get Data"),
            ),
          ],
        ),
      ),
    );
  }
}
