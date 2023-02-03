import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mission1/mainpages/secondscreen.dart';

class PostCard extends StatefulWidget {
  @override
  _PostCardState createState() => _PostCardState();
}



class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Center(
              child: Text(
                'Food Vision',
                style: TextStyle(fontSize: 23),
              ),
            ),
          ),
          Container(
            width: 350,
            height: 280,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.orange,
                  width: 3,
                )),
            child: Image.asset('image/2.jpg'),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              height: 55,
              child: Column(
                children: [
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(
                      '직접 추가하기',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              )),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              //textfield 값 받아서 재료3에 넣기
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '입력하세요',
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            child: Text(
              '추가된 재료',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          //여기에 추가된 재료 목록 column으로 묶는다
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      child: Text(
                        '재료1',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Container(
                      child: Text(
                        '재료2',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Container(
                      child: Text(
                        '재료3',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Container(
                      child: Text(
                        '재료3',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: 130,
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SafeArea(child: SecondScreen())),
                );
              },
              child: Text(
                '다음',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  primary: Colors.orange,
                  side: BorderSide(
                    color: Colors.orangeAccent,
                    width: 3,
                  )),
            ),
          )
        ],
      )),
    );
  }
}
