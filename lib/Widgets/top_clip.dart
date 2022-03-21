import 'package:flutter/material.dart';

class CustomClipPathTop extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height / 4);

    path.quadraticBezierTo(20, (size.height / 4), 50, 65);

    path.quadraticBezierTo(size.width / 2, 150, size.width, 20);

    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
