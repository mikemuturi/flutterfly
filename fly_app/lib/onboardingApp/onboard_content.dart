import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class OnBoardingContent extends StatelessWidget {
   String ?image;
  String ?title;
  String ?desc;
  OnBoardingContent({super.key, this.desc, this.image, this.title});

 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(image!),
         Text( title.toString(),style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w700), ),
         Text( desc.toString(),style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w700), ),
        
      ],
    );
  }
}