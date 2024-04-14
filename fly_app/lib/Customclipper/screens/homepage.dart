import 'dart:math';

import 'package:flutter/material.dart';


class ClipperHomePage extends StatelessWidget {
  const ClipperHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        height: double.infinity,
        width: double.infinity,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // ClipRRect(
            //   clipBehavior: Clip.hardEdge,
            //   borderRadius: BorderRadius.circular(50),
            //   child: Container(
            //     height: 300,
            //     width: 300,
            //     color: Colors.orange,
            //   ),
            // ),
            //
            //
            // ClipOval(
            //   clipper: MyClipper(),
            //   child: Container(
            //     height: 300,
            //     width: 300,
            //     color: Colors.red,
            //   ),
            // ),

            Container(
              height: 350,
              width: 300,
              color: Colors.red,

              child: ClipPath(
                clipper: TriangleClipper(),child: Container(
                color: Colors.yellow,
              ),

              ),
            )



          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0,20 ,200,200);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
   return true;
  }

}



class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width / 2, 0); // Top point
    path.lineTo(0, size.height); // Bottom-left point
    path.lineTo(size.width, size.height); // Bottom-right point
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

