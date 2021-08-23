import 'package:flutter/material.dart';
import 'package:auth_ex/provider.dart';
import 'package:auth_ex/auth.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: Auth(),
      child: MaterialApp(
        title: 'Auth Demo',
        theme: ThemeData.dark(),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BaseAuth auth = Provider.of(context).auth;
    return StreamBuilder<String>(stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot){
      if(snapshot.connectionState == ConnectionState.active){
        final bool loggedIn = snapshot.hasData;
        return loggedIn ? HomePage():LoginPage();
      }
      return CircularProgressIndicator();
      },
    );
  }
}

