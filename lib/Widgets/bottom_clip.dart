import 'package:flutter/cupertino.dart';

class BottomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height / 3);

    path.quadraticBezierTo(40, 125, 60, 132);

    path.quadraticBezierTo(185, 179, size.width / 2, 173);

    path.quadraticBezierTo((size.width / 2), 180, size.width, 125);

    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
