import 'package:agora_0714_3/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';
import '../pages/call.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _channelController = 'demo';
  bool _validateError = false;
  ClientRole? _role = ClientRole.Broadcaster;

  @override
  Widget build(BuildContext context) {
    //return GetBuilder<DashboardController>(
    //    builder: (controller) {
    return Scaffold(
      backgroundColor: Color(0xffD3F1D5),
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black, letterSpacing: 2.0),
        ),
        backgroundColor: Colors.white,
        elevation: 2.0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          Column(
            children: [
              Image.asset('images/plant.gif',
              height: MediaQuery.of(context).size.height/3,
              ),
            ],
          ),
          Expanded(
            child: Align(
              //alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white, //new Color.fromRGBO(255, 0, 0, 0.0),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      '고민말고 도움을 요청하세요!'
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      //버튼 사이즈
                      // height: 100,
                      // width: 250,
                      padding: EdgeInsets.all(13),
                      child: ButtonTheme(
                        minWidth: 200,
                        child: ElevatedButton(
                          onPressed: (){
                            showDialog(context: context,
                                builder: (BuildContext context){
                                  return AlertDialog(
                                    title: Text('즉시연결!',
                                    style: TextStyle(
                                      fontSize: 20
                                    ),),
                                    content: Container(
                                      height: MediaQuery.of(context).size.height/3,
                                      width: 300,
                                      child: ListView(
                                        shrinkWrap: true,
                                        children: ListTile.divideTiles(
                                            context: context,
                                            tiles: [
                                              ListTile(
                                                title: Text('해외'),
                                                leading: Icon(CupertinoIcons.globe),
                                                onTap: onJoin,
                                              ),
                                              ListTile(
                                                title: Text('전자기기'),
                                                leading: Icon(Icons.build),
                                                onTap: onJoin,
                                              ),
                                              ListTile(
                                                title: Text('자동차'),
                                                leading: Icon(Icons.taxi_alert),
                                                onTap: onJoin,
                                              ),
                                              ListTile(
                                                title: Text('교통'),
                                                leading: Icon(Icons.commute),
                                                onTap: onJoin,
                                              ),
                                              ListTile(
                                                title: Text('학교생활'),
                                                onTap: onJoin,
                                                leading: Icon(CupertinoIcons.lightbulb),
                                              ),
                                              ListTile(
                                                title: Text('가벼운 질문'),
                                                onTap: onJoin,
                                                leading: Icon(CupertinoIcons.question)
                                              ),
                                            ]
                                        ).toList(),
                                      )
                                    )
                                  );
                                }
                            );
                          },
                          child: SizedBox(
                            height: 80,
                            child: Center(
                              child: Text(
                                'Ask',
                                style: TextStyle(
                                  fontSize: 20
                                ),
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff162840),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(45),
                            ),
                            textStyle: TextStyle(
                              fontSize: 10.0,
                              fontFamily: GoogleFonts.notoSans().fontFamily,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
  Future<void> onJoin() async {
    // update input validation
    // setState(() {
    //   _channelController.text.isEmpty
    //       ? _validateError = true
    //       : _validateError = false;
    // });
    if (_channelController.isNotEmpty) {
      // await for camera and mic permissions before pushing video page
      await _handleCameraAndMic(Permission.camera);
      await _handleCameraAndMic(Permission.microphone);
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            channelName: _channelController,
            role: _role,
          ),
        ),
      );
    }
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }
}
