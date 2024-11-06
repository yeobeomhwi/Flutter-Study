import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';

class FirebaseCloudFunctionsApp extends StatelessWidget {
  const FirebaseCloudFunctionsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Firebase Cloud Functions',
      home: TestScreen(),
    );
  }
}
class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final functions = FirebaseFunctions.instance;

  Future<void> createUser() async{
    try {
      // 사용자 추가
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // 성공적으로 추가된 경우
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('사용자가 성공적으로 생성되었습니다.')),
      );
    } on FirebaseAuthException catch (e) {
      // 오류 처리
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('오류: ${e.message}')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firebase Cloud Functions')),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true, // 비밀번호 입력 시 텍스트 숨김
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: createUser,
                child: const Text('생성'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}