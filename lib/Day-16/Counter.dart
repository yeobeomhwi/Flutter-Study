import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: Home()
    );
  }
}
//GetxController 를 추가한다.
class TestController extends GetxController {
  var count = 0; //.Obs없이
  void increment() {
    count++; //상태값이 변경되었다면...
    update(); //명시적인 Update 호출이 필요하다
  }
}
class Home extends StatelessWidget {
  //Get시스템 상에 TestController를 등록한다.
  final controller = Get.put(TestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("counter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //builder에서 갱신
            GetBuilder<TestController>(
              builder: (_) => Text('clicks: ${controller.count}',//사용한다
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          controller.increment(); //증가시킨다
        },
      ),
    );
  }
}