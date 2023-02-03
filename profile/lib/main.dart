import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        backgroundColor: Colors.yellow,
        body:SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const[
              CircleAvatar(
                radius:60,
                backgroundImage: AssetImage('images/photo1.jpeg'),
              ),
              SizedBox(height:20,),
              Text('김석희',style: TextStyle(fontSize: 40,color: Colors.black,fontFamily:'Jalnan',fontWeight: FontWeight.bold),),
              SizedBox(height:10,),
              Text('Flutter Developer',style: TextStyle(fontSize: 20,color: Colors.black,fontFamily:'Jalnan',fontWeight: FontWeight.bold),),
              SizedBox(
                width:190,
                  child:Divider(color:Colors.black)
              ),
              Card(color:Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child:ListTile(leading:
                  Icon(Icons.phone,color: Colors.amber,),
                    title:Text("010-7751-4295",style:TextStyle(fontSize:17,color:Colors.black,fontFamily: 'Jalnan'))
                  )),
              Card(color:Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),//horizontal : 양 옆, vertial: 위아래
                  child:ListTile(leading:
                  Icon(Icons.email,color: Colors.amber,),
                      title:Text("cat1181123@naver.com",style:TextStyle(fontSize:17,color:Colors.black,fontFamily: 'Jalnan'))
                  ))

            ],
          )
        )
      ),
    );
  }
}


