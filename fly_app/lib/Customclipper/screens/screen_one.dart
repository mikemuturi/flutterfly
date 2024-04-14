import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fly_app/Customclipper/Utils/custom_container.dart';
import 'package:fly_app/Customclipper/constants/colors.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: orangeColor,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipPath(
                  clipper: SlantedTopClipper(),
                  child: Container(
                    color: yelloColor, // Adjust the color as needed
                    height: 400, // Adjust the height as needed
                    width: MediaQuery.of(context)
                        .size
                        .width, // Adjust the width as needed,
                  )),
            ),
            Align(
              alignment: Alignment(0.0, 0.2),
              child: Container(
                  height: 600,
                  child: SvgPicture.asset(
                    'assets/svg/girl.svg',
                    fit: BoxFit.cover,
                  )),
            ),
            Positioned(
              top: 100,
              left: 50,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.white,fontSize: 56,fontWeight: FontWeight.bold),
                  text: "Make\nFiriends".toUpperCase(),
                  children: [
                    TextSpan(
                      text: "\nwith us".toString(),
                      style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold)
                    ),
                    TextSpan(
                      style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.normal),
                      text: "\nDivie in to the world of social \nrainbows for better networking"
                    )
                  ]
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.all(20),
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bucckle up!",style: TextStyle(color: Colors.black,fontSize: 16),),
                        Text("Let's Get\nStarted Now",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold))
                      ],
                    ),

                    Container(
                      child: Center(
                        child: Icon(Icons.arrow_forward),
                      ),
                      height: 45,
                      width: 50,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black54,
                            offset: Offset(-6,5),
                            blurRadius: 1
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}