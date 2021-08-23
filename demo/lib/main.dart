import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screen/home.dart';
import 'Screen/splash.dart';
import 'Theme/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme1,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/', page: () => SplashScreen(),
        ),
        GetPage(
          name: '/home', page: () => HomePage(),
        ),
      ],
    );
  }
}


