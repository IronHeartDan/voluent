import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';


class WaveClip extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width,size.height*0.004838264);
    path_0.cubicTo(size.width*0.9655217,size.height*0.04835006,size.width*0.9321812,size.height*0.09843046,size.width*0.8981087,size.height*0.1496126);
    path_0.cubicTo(size.width*0.8025411,size.height*0.2931713,size.width*0.7012029,size.height*0.4453943,size.width*0.5527778,size.height*0.4856322);
    path_0.cubicTo(size.width*0.3974155,size.height*0.5277517,size.width*0.2457585,size.height*0.3946339,size.width*0.1442507,size.height*0.3055339);
    path_0.cubicTo(size.width*0.1242135,size.height*0.2879460,size.width*0.1061302,size.height*0.2720730,size.width*0.09035797,size.height*0.2596017);
    path_0.lineTo(0,size.height*0.2259799);
    path_0.lineTo(0,size.height*0.7471264);
    path_0.lineTo(size.width*0.09035797,size.height*0.7471264);
    path_0.cubicTo(size.width*0.1392870,size.height*0.7471264,size.width*0.1873372,size.height*0.7859598,size.width*0.2491884,size.height*0.8359540);
    path_0.cubicTo(size.width*0.3082802,size.height*0.8837069,size.width*0.3799686,size.height*0.9416494,size.width*0.4770531,size.height*0.9856322);
    path_0.cubicTo(size.width*0.5815290,size.height*1.032966,size.width*0.7100700,size.height*0.9495805,size.width*0.8347512,size.height*0.8687069);
    path_0.cubicTo(size.width*0.8915121,size.height*0.8318851,size.width*0.9474734,size.height*0.7955805,size.width,size.height*0.7723736);
    path_0.lineTo(size.width,size.height*0.004838264);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(Offset(0,size.height*0.3419540), Offset(size.width*2.200483,size.height*0.3419540), [Color(0xff705DEE).withOpacity(1),Color(0xffFFC3A0).withOpacity(1)], [0.0625,1]);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}