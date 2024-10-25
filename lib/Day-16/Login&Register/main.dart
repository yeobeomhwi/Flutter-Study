import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studyfluter/Day-16/Login&Register/LoginScreen.dart';
import 'package:studyfluter/Day-16/Login&Register/HomeScreen.dart';
import 'package:studyfluter/Day-16/Login&Register/RegisterScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Login and Registration App',
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/register', page: () => RegisterScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),
      ],
    );
  }
}

class AuthController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  var registeredEmail = ''.obs;
  var registeredPassword = ''.obs;

  void setEmail(String value) {
    // TODO: Implement the setEmail method
    email.value = value;
  }

  void setPassword(String value) {
    // TODO: Implement the setPassword method
    password.value = value;
  }

  Future<void> login() async {
    // TODO: Implement the login method
    if(email.value.isEmpty || password.value.isEmpty){
      Get.snackbar('Error', '값이 없습니다.');
      return;
    }
    isLoading.value = true;

    await Future.delayed(Duration(seconds: 1));

    if(email.value == registeredEmail.value && password.value == registeredPassword.value){
      Get.offNamed('/home');
    }else{
      Get.snackbar('Error', '로그인 불가');
    }
    isLoading.value =false;
  }

  Future<void> register() async {
    // TODO: Implement the register method

    if(email.value.isEmpty || password.value.isEmpty){
      Get.snackbar('Error', '값이 없습니다.');
      return;
    }
    isLoading.value = true;

    await Future.delayed(Duration(seconds: 1));

    registeredEmail.value = email.value;
    registeredPassword.value = password.value;

    Get.snackbar('Success', '가입 완료');
    Get.offNamed('/login');

    isLoading.value = false;
  }
}

