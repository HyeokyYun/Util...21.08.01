import 'package:flutter/material.dart';
import 'package:auth_ex/auth.dart';

class Provider extends InheritedWidget{
  final BaseAuth auth;

  Provider([
    required Key key,
    required Widget child,
    required this.auth,
  ]) : super(
    key: key,
    child: child,
  );

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static Provider of(BuildContext context)=>
      (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider);

}