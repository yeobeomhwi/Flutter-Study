import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireStoreQuery extends StatelessWidget {
  const FireStoreQuery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FireStoreQuery',
      home: FireStoreQueryScreen(),
    );
  }
}

class FireStoreQueryScreen extends StatelessWidget {
  FireStoreQueryScreen({super.key});

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void fetchData() async {
    CollectionReference users = _firestore.collection('users');

    QuerySnapshot querySnapshot = await users.get();
    for (var doc in querySnapshot.docs) {
      print('${doc.id} => ${doc.data()}');
    }
  }

  void fetchSpecificDoc() async {
    DocumentReference document = _firestore.collection('users').doc('test_doc');

    DocumentSnapshot documentSnapshot = await document.get();
    if (documentSnapshot.exists) {
      print('Document data : ${documentSnapshot.data()}');
    } else {
      print('Document does not exist!');
    }
  }

  void fetchDataWithCondition() async {
    CollectionReference users = _firestore.collection('users');

    //나이가 18 이상인 사용자 검색

    QuerySnapshot querySnapshot =
        await users.where('age', isGreaterThanOrEqualTo: 18).get();

    for (var doc in querySnapshot.docs) {
      print('${doc.id} => ${doc.data()}');
    }
  }

  void fetchDataWithCondition2() async {
    CollectionReference users = _firestore.collection('users');

    //나이가 19 이상인 사용자 검색

    QuerySnapshot querySnapshot = await users
        .where('age', isGreaterThanOrEqualTo: 19)
        .where('name', isEqualTo: 'yeobeomhwi')
        .get();

    for (var doc in querySnapshot.docs) {
      print('${doc.id} => ${doc.data()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FireStoreQuery'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                fetchData();
              },
              child: const Text('1: fetchData'),
            ),
            ElevatedButton(
              onPressed: () {
                fetchSpecificDoc();
              },
              child: const Text('2: fetchSpecificDoc'),
            ),
            ElevatedButton(
              onPressed: () {
                fetchDataWithCondition();
              },
              child: const Text('3: fetchDataWithCondition'),
            ),
            ElevatedButton(
              onPressed: () {
                fetchDataWithCondition2();
              },
              child: const Text('4: fetchDataWithCondition2'),
            ),
          ],
        ),
      ),
    );
  }
}
