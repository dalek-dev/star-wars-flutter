import 'dart:math';

import 'package:flutter/material.dart';

class StarPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size){

    _drawStar(canvas, 30.0, 35.0, 2.0, 0.35);
    _drawStar(canvas, 25.0, 150.0, 2.5, 0.6);
    _drawStar(canvas, 180.0, 75.0, 2.5, 0.9);
    _drawStar(canvas, 265.0, 80.0, 1.5, 0.4);
    _drawStar(canvas, 165.0, 150.0, 2.5, 0.75);
    _drawStar(canvas, 270.0, 155.0, 2.0, 0.35);
    _drawStar(canvas, 70.0, 215.0, 2.0, 0.35);
    _drawStar(canvas, 210.0, 233.0, 2.0, 0.35);
    _drawStar(canvas, 20.0, 235.0, 2.0, 0.35);
    _drawStar(canvas, 15.0, 350.0, 2.5, 0.6);
    _drawStar(canvas, 170.0, 475.0, 2.5, 0.9);
    _drawStar(canvas, 255.0, 380.0, 1.5, 0.4);
    _drawStar(canvas, 155.0, 450.0, 2.5, 0.75);
    _drawStar(canvas, 260.0, 555.0, 2.0, 0.35);
    _drawStar(canvas, 60.0, 515.0, 2.0, 0.35);
    _drawStar(canvas, 200.0, 33.0, 2.0, 0.35);
    _drawStar(canvas, 355.0, 180.0, 1.5, 0.4);
    _drawStar(canvas, 255.0, 250.0, 2.5, 0.75);
    _drawStar(canvas, 360.0, 355.0, 2.0, 0.35);
    _drawStar(canvas, 40.0, 615.0, 2.0, 0.35);
    _drawStar(canvas, 500.0, 533.0, 2.0, 0.35);


  }

   _drawStar(Canvas canvas, double dx, double dy, double radius, double opacity) {
     var starGradientRadius =  radius * 1.8;
     var starCenter = new Offset(dx, dy);

     var circleGradientShader = new RadialGradient(
         colors: [
           Colors.white.withOpacity(opacity),
           Colors.white.withOpacity(0.0)
         ]
     ).createShader(
       new Rect.fromCircle(center:starCenter, radius: starGradientRadius),
     );
     canvas.drawCircle(starCenter, starGradientRadius,
         new Paint()..shader = circleGradientShader);
     canvas.drawCircle(
       starCenter,
       radius,
       new Paint()..color = Colors.white.withOpacity(opacity),
     );
   }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

}