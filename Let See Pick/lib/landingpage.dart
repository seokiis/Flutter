import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission1/mainpages/homescreen.dart';
import 'package:mission1/mainpages/secondscreen.dart';

class LandingPage extends StatefulWidget{

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>{
  @override
  void initState(){
    //3초후에 메인페이지로 진입하게 해주는 timer
    Timer(Duration(seconds: 3),(){
       Get.offAll(HomeScreen());
    //  다시 landing페이지로 이동하는것 방지
    });
    super.initState();
  }
  Widget build(BuildContext context){
    return Scaffold(
      //Stack : 이하의 children의 모든것을 겹쳐보이게 해주는역할
      body: Stack(
        alignment:  Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            //mediaquery 해당 디바이스의 높낮이
            color: Colors.purple,
            child: Center(child: Text('get start'),),
          ),
          CircularProgressIndicator(),
          //원형로딩창
        ],
      )
    );
  }
}