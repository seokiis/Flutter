import 'package:flutter/material.dart';
import 'package:mission1/landingpage.dart';
//페이지 연결
import 'package:get/get.dart';
    
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // MyApp({Key? key}) : super(key: key);

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    //get을 넣어서 get으로 페이지 이동하게끔 변경
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'Jalnan'), //전체테마의폰트 바꿔줌
      home: LandingPage(),
    );
  }
}


