import 'package:flutter/material.dart';
import 'package:mission1/cards/postcard.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(

      resizeToAvoidBottomInset: false,
      body: SafeArea(child:
        PostCard(),
      )
      );
  }
}