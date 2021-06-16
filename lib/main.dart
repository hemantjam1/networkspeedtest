import 'package:flutter/material.dart';

import 'HomePage.dart';

void main() {
  runApp(SpeedTestApp());
}

class SpeedTestApp extends StatelessWidget {
  const SpeedTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speed Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.orange[100], accentColor: Colors.white54),
      home: HomePage(),
    );
  }
}
