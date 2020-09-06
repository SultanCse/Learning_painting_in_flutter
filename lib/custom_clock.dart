import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

class CustomClock extends StatefulWidget {
  @override
  _CustomClockState createState() => _CustomClockState();
}

class _CustomClockState extends State<CustomClock> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('hi');
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: CustomPaint(
            painter: ClockPainter(),
          ),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  DateTime dateTime = DateTime.now();
  @override
  void paint(Canvas canvas, Size size) {
    Paint fillCircle = Paint()..color = Color(0xff9999ff);
    Paint borderCircle = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    Paint secLine = Paint()
      ..color = Color(0xffffbf00)
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;
    Paint minLine = Paint()
      ..color = Colors.red
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    Paint hourLine = Paint()
      ..color = Colors.cyanAccent
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;
    Paint outerSecLines = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    var centerX = size.height / 2;
    var centerY = size.width / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    canvas.drawCircle(center, radius - 20, fillCircle);
    canvas.drawCircle(center, radius - 20, borderCircle);

    var secLineX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var secLineY = centerY + 80 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secLineX, secLineY), secLine);

    var minLineX = centerX + 60 * cos(dateTime.minute * 6 * pi / 180);
    var minLineY = centerY + 60 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minLineX, minLineY), minLine);

    var hourLineX = centerX + 40 * cos(dateTime.minute * 0.5 * pi / 180);
    var hourLineY = centerY + 40 * sin(dateTime.minute * 0.5 * pi / 180);
    canvas.drawLine(center, Offset(hourLineX, hourLineY), hourLine);

    // var outLineStartDistance = radius;
    // var outLineEndDistance = radius - 14;
    // for (double i = 0; i < 13; i = i + 12) {
    //   var x1 = centerX + outLineStartDistance * cos(i * pi / 180);
    //   var y1 = centerX + outLineEndDistance * sin(i * pi / 180);
    //
    //   var x2 = centerX + outLineStartDistance * cos(i * pi / 180);
    //   var y2 = centerX + outLineEndDistance * sin(i * pi / 180);
    //   canvas.drawLine(Offset(x1, y1), Offset(x2, y2), outerSecLines);
    //   print(i);
    // }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
