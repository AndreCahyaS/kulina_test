import 'package:flutter/material.dart';
import 'screens/KulinaHome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(        
      ),
      home: KulinaHome(title: 'Flutter Demo Home Page'),
    );
  }
}