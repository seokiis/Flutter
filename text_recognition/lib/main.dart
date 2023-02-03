import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String scannedText = '';
  XFile? imageFile;
  bool textScanning=false;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Text Recognition example",style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.amberAccent,
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                if(textScanning)const CircularProgressIndicator(),
                if(! textScanning && imageFile==null)
                  Container(
                    height: 300,
                    width: 300,
                    margin: EdgeInsets.all(20),
                    color: Colors.blueGrey,
                  ),
                if(imageFile!=null) Image.file(File(imageFile!.path)),
                SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: () {
                    getimage(ImageSource.gallery);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amberAccent,
                      // 백그라운드 외의 나머지 색
                      foregroundColor: Colors.black,
                      // 그림자 색
                      shadowColor: Colors.black,
                      // 그림자 강도
                      elevation: 10,

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                  child: Container(
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Icon(Icons.image, size: 30,),
                          Text('Gallery', style: TextStyle(fontSize: 13),),
                          SizedBox(height: 10,),
                        ],
                      )
                  ),
                ),
                SizedBox(height: 20,),
                Text(scannedText, style: TextStyle(fontSize: 20,),)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getimage(ImageSource source) async{
    try{
      final pickedImage=await ImagePicker().pickImage(source: source);
      if(pickedImage!=null){
        textScanning=true;
        imageFile=pickedImage;
        setState(() {});
        getRecognisedText(pickedImage);
      }
    }catch(e){
        textScanning=false;
        imageFile=null;
        scannedText="Error while Scanning";
        setState(() {});
    }
  }

  void getRecognisedText(XFile image) async{
    final inputImage=InputImage.fromFilePath(image.path);
    final textDetector=GoogleMlKit.vision.textDetector();

    RecognisedText recognisedText=await textDetector.processImage(inputImage);
    await textDetector.close();

    scannedText="";
    for(TextBlock block in recognisedText.blocks){
      for(TextLine line in block.lines){
        scannedText=scannedText + line.text + "\n";
      }
    }
    textScanning=false;
    setState(() {});
  }

  void initiate(){
    super.initState();
  }
}

