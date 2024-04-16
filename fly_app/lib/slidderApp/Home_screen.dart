import 'package:flutter/material.dart';
import 'package:fly_app/slidderApp/corousel_slider.dart';


class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: const Row(
                        children: [
                          Text("Welcome", style: TextStyle(color: Colors.black, fontSize: 30),),
                          Spacer(),
                          Text("Mike", style: TextStyle(color: Colors.black, fontSize: 22),)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  const CircleAvatar()
                ],
              ),
              const SizedBox(height: 20,),
              const Text("Exciting offers for you", style: TextStyle(color: Colors.black, fontSize: 22),),
              const SizedBox(height: 20,),
              const CarouselScreen(),
              
            ],
          ),
        )
      ),
    );
  }
}