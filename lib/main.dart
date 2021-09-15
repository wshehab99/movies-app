import 'package:flutter/material.dart';

import 'UI/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(primaryColor: Colors.deepPurple),
      home: Home(),
    );
  }
}
