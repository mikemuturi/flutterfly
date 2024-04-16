import 'package:flutter/material.dart';
import 'dart:async';



class CarouselScreen extends StatefulWidget {
  const CarouselScreen({super.key});

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  int activePage=0;
List<String> imageUrls = [
  "https://images.pexels.com/photos/1191403/pexels-photo-1191403.jpeg",
  "https://images.pexels.com/photos/1191403/pexels-photo-1191403.jpeg",
  "https://images.pexels.com/photos/1191403/pexels-photo-1191403.jpeg",
  "https://images.pexels.com/photos/1191403/pexels-photo-1191403.jpeg",
  "https://images.pexels.com/photos/9020063/pexels-photo-9020063.png",
  "https://images.pexels.com/photos/12437389/pexels-photo-12437389.jpeg",
  "https://images.pexels.com/photos/58997/pexels-photo-58997.jpeg",
];

  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8
    );
    autoScroll();
    super.initState();
  }

  void autoScroll(){
    Timer.periodic( const Duration(seconds: 3), (timer){
      if (mounted){
        _pageController.nextPage(duration: (const Duration(microseconds: 500)),
        curve: Curves.easeInOut);
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
            controller: _pageController,
            itemCount: imageUrls.length*100,
            onPageChanged: (page){
              int currentPage = page%imageUrls.length*1000;
              // print(currentPage);
              setState(() {
                activePage=currentPage;
              });
        
            },
            itemBuilder: (context, pagePosition){
        
              int index = pagePosition%imageUrls.length*1000;
              bool active = index == activePage;
              return slider(imageUrls, pagePosition, active);
            }),
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
            imageIndicator(imageUrls.length, activePage)
          
        )
      ],
    );
  }
}

AnimatedContainer slider(imageUrls, pagePosition, active){

  int index = pagePosition%imageUrls.length;
  double margin = active? 10 : 20;
  return AnimatedContainer(
    duration: Duration(milliseconds: 500),
    curve: Curves.bounceInOut,
    margin: EdgeInsets.all(margin),
    decoration:  BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(
        imageUrls[index]
        )
        )
    ),
    );
}





List <Widget> imageIndicator(imageUrlsLength, currentIndex){
  return List<Widget>.generate(imageUrlsLength, (index) {
    return Container(
      margin: const EdgeInsets.symmetric( vertical: 5, horizontal: 5),
      height: 10,
      width: 15,
      decoration:  BoxDecoration(
        color: currentIndex == index? Colors.green : Colors.black,
        shape: BoxShape.circle
      ),
    );
  });
}