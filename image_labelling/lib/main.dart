import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


import 'package:flutter/material.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
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

  bool imageLabelChecking = false;
  String imageLabel = "test label";
  XFile? imageFile;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: const Text("이미지 분류하기"),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                if(imageLabelChecking) const CircularProgressIndicator(),
                //이미지가 없으면
                if(!imageLabelChecking && imageFile==null )
                  Container(
                    width: 400,
                    height: 350,
                    margin:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    color: Colors.blueGrey,
                  ),
               //있으면
               if(imageFile!=null)
                  Image.file(File(imageFile!.path),),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    getImage(ImageSource.gallery);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white,),
                  child: Container(
                    child: Column(
                      children: const [
                        SizedBox(height: 10,),
                        Icon(Icons.image, size: 30, color: Colors.blueGrey,),
                        Text('Gallery',
                          style: TextStyle(fontSize: 13, color: Colors.blueGrey, fontWeight: FontWeight.bold,),
                        ),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Text(imageLabel, style: TextStyle(fontSize: 20, ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void getImage(ImageSource source) async{
    try{
      //이미지의 소스
      final pickedImage=await ImagePicker().pickImage(source: source);
      if(pickedImage!=null){
        imageLabelChecking=true;
        imageFile=pickedImage;
        setState((){});
        getImageLabels(pickedImage);
      }
    }catch(e){
      imageLabelChecking=false;
      imageFile=null;
      imageLabel="Error";
      setState((){});

    }
  }

  void getImageLabels(XFile image) async{
    //이미지의 path
    final inputImage= InputImage.fromFilePath(image.path);
    ImageLabeler imageLabeler=ImageLabeler(options: ImageLabelerOptions(confidenceThreshold: 0.75));
    List<ImageLabel> labels =await imageLabeler.processImage((inputImage));
    //글 작성
    StringBuffer sb= StringBuffer();
    for(ImageLabel imgLabel in labels){
      String lbText = imgLabel.label;
      double confidence = imgLabel.confidence;
      sb.write(lbText);
      sb.write(" : ");
      sb.write((confidence*100).toStringAsFixed(2));
      sb.write("%\n");
    }
    imageLabeler.close();
    imageLabel=sb.toString();
    imageLabelChecking=false;
    setState(() {
    });
  }
}

