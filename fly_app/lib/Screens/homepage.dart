import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fly_app/constants/decorations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final CustomDecoration _customDecoration = CustomDecoration();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        backgroundColor: const Color(0xff313754),
        title: const Text("SoftWare Engineer"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
      height: double.infinity,
      width: double.infinity,
      child:  Column(
        children: [
          Container(
            // margin: EdgeInsets.all(20),
            height: 500,
            padding: const EdgeInsets.all(10),
            // color: Color(0xff313754),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    height: 400,
                    width: size.width*0.79,
                  decoration: _customDecoration.cardDecoration,
                  ),
                ),
                    Positioned(
                  bottom: 35,
                  right: -12,
                  child: Container(
                    height: 200,
                    child: Image.asset('lib/images/mike-removebg.png'),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 40,
                  child: Container(
                    child: const Center(
                      child: Text("Available", style: TextStyle(color: Colors.white),),
                    ),
                    height: 50,
                    width: 150,
                    decoration: _customDecoration.tileDecoration,
                  ),
                ),
                Positioned(
                  right: 40,
                  top: 90,

                  child: Container(
                  height: 150,
                  width: 80,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FaIcon(FontAwesomeIcons.envelope, color: Colors.white, size: 34,),
                      FaIcon(FontAwesomeIcons.video, color: Colors.white, size: 34,),
                      FaIcon(FontAwesomeIcons.phone, color: Colors.white, size: 34,),
                    ],
                  ),
                )),
                Positioned(
                  bottom: 100,
                  left: 44,
                  child: Container(
                    child: const Row(
                      children: [
                          FaIcon(FontAwesomeIcons.solidStar, color: Colors.orangeAccent, size: 22,),
                          FaIcon(FontAwesomeIcons.solidStar, color: Colors.orangeAccent, size: 22,),
                          FaIcon(FontAwesomeIcons.solidStar, color: Colors.orangeAccent, size: 22,),
                          FaIcon(FontAwesomeIcons.solidStar, color: Colors.orangeAccent, size: 22,),
                          FaIcon(FontAwesomeIcons.solidStar, color: Colors.grey, size: 22,),
                  
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 150,
                  left: 44,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: const Center(
                      child: Text("DM Now", style: TextStyle(color: Colors.white),),
                    ),
                    height: 45,
                    decoration: _customDecoration.tileDecoration,
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 40,

                  child: Container(
                    height: 100,
                    width: 150,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mike Muturi",
                      style: TextStyle(color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "SoftWare Engineer",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                    ),
                  ),
                ),
              Positioned(
                top: 150,
                left: 40,
                child: Container(
                  height: 100,
                  width: size.width/2,
                  child: const Text(
                        """Professional Web, Application and Software Developer, Crafting quality software and Mobile application for your business. """,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                ),
              )
              ],
            ),
          )
        ],
      ),
    ),
    );
  }
}