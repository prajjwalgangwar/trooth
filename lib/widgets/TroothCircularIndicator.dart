import 'dart:math';
import 'package:flutter/material.dart';

class TroothCircularIndicatorView extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: CustomPaint(
          painter: TroothCircularIndicatorPainter(progress: 3.5, taskNotCompletedColor: Colors.orange, taskCompletedColor: Colors.green),
        ),
      ),
    );
  }
}

class TroothCircularIndicatorPainter extends CustomPainter{

  final double progress;
  final Color taskCompletedColor;
  final Color taskNotCompletedColor;

  TroothCircularIndicatorPainter(
      { required this.progress, required this.taskCompletedColor, required this.taskNotCompletedColor});


  @override
  void paint(Canvas canvas, Size size) {

    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = Colors.red;

    var outerCircle = Paint()
      ..color = Colors.blue.shade900
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4
    ;

    canvas.drawCircle(center, radius, fillBrush);
    canvas.drawCircle(center, radius, outerCircle);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }



}