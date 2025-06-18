import 'package:flutter/material.dart';

class ArchTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Top arch
    path.moveTo(0, size.height * 0.2);
    path.quadraticBezierTo(
      size.width / 2, 0,
      size.width, size.height * 0.2,
    );

    // Down the sides and bottom
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
