import 'package:flutter/material.dart';
import 'package:test_work/src/page/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Test',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: SplashPage(),
    );
  }
}
