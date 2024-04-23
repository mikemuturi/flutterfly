import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fly_app/onboardingApp/demodata.dart';
import 'package:fly_app/onboardingApp/dot_indicator.dart';
import 'package:fly_app/onboardingApp/onboard_content.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  int  _pageIndex= 0;

  Timer? _timer;

  late PageController _pageController;

  @override
  void initState() {

    super.initState();
    _pageController = PageController(initialPage: 0);

    _timer=Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if(_pageIndex<3){
        _pageIndex++;
      }else{
        _pageIndex=0;
      }
      _pageController.animateToPage(_pageIndex,
       duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn);
     });
  }
  @override
  void dispose()
  {
  _pageController.dispose();
  _timer!.cancel();
  super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child:  Column(
          children: [
            //here the slider
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex=index;
                  });
                },
                controller: _pageController,
                itemCount: demodata.length,
                itemBuilder: (context, index){
                  return OnBoardingContent(image: demodata[index].Image,
                   title: demodata[index].title,
                    desc: demodata[index].description);
                })),
            //indicator
            Padding(padding: EdgeInsets.only(bottom: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(demodata.length, (index) => Padding(padding: EdgeInsets.only(right: 5),
                child: DotIndicator(
                  isActive: index==_pageIndex,
                ),
                )
                ),
              ],
            ),
            ),
            //then the button
          InkResponse(
            splashColor: Colors.pink.withOpacity(0.5),
            onTap: () {
              
            },
            child: Container(
              child: const Center(
                child: Text("Get Started", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ),
              height: 45,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.pink
              ),
            ),
          ),
          const SizedBox(height: 25,),
          ]
        ),
      ),
    );
  }
}