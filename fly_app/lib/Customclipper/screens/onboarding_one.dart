import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fly_app/Customclipper/Utils/clippler_class.dart';
import 'package:fly_app/Customclipper/constants/colors.dart';



class OnBoardingOne extends StatelessWidget {
  const OnBoardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [

            Container(
              height: double.infinity,
              width: double.infinity,
              color: orangeColor,
            ),


            Align(
              alignment: Alignment.bottomCenter,
              child: ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  color: yelloColor,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(20),
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bucckle up!",style: TextStyle(color: Colors.white,fontSize: 16),),
                        Text("Let's Get\nStarted Now",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold))
                      ],
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [

                          BoxShadow(
                            color: Colors.black54,
                            offset: Offset(-6,5),
                            blurRadius: 1
                          )
                        ]
                      ),
                      child: const Center(child: Icon(Icons.arrow_forward_ios),),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0.0, 0.2),
              child: Container(
                  height: 600,
                  child: SvgPicture.asset(
                    'assets/img/girl.svg',
                    fit: BoxFit.cover,
                  )),
            ),

            Positioned(
              top: 100,
              left: 30,
              child: RichText(
                text: TextSpan(
                    style: const TextStyle(color: Colors.white,fontSize: 56,fontWeight: FontWeight.bold),
                    text: "Make\nFriends".toUpperCase(),
                    children: [
                      TextSpan(
                          text: "\nwith us".toString(),
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)
                      ),
                      const TextSpan(
                          style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.normal),
                          text: "\nDivie in to the world of social \nrainbows for better networking"
                      )
                    ]
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}