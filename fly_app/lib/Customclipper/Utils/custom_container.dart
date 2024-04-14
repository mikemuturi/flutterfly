import 'package:flutter/material.dart';

class SlantedTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.32); // Start from the bottom-left corner
    path.lineTo(size.width, 0); // Move to the top-right corner with a slant
    path.lineTo(size.width, size.height); // Move to the bottom-right corner
    path.lineTo(0, size.height); // Complete the shape to the bottom-left corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}