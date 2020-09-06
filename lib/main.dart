import 'package:flutter/material.dart';
import 'custom_clock.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomClock(),
    );
  }
}
