import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _lastLogin = 'Never';

  @override
  void initState() {
    super.initState();
    _loadLastLogin();
  }

  Future<void> _loadLastLogin() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _lastLogin = prefs.getString('lastLogin') ?? 'Never';
    });
  }

  Future<void> _saveLastLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastLogin', DateTime.now().toString());
    _loadLastLogin();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('로그인했습니다.'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Last Login Time'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Last Login: $_lastLogin',
              style: const TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _lastLogin = DateTime.now().toString();
                  _saveLastLogin();
                });
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
