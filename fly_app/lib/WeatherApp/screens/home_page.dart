import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fly_app/WeatherApp/data/image_path.dart';
import 'package:fly_app/WeatherApp/utils/apptext.dart';
import 'package:fly_app/WeatherApp/utils/custom_divider_page.dart';

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({Key? key});

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  bool _clicked = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(background[0]),
          ),
        ),
        child: Stack(
          children: [
          _clicked == true?  Positioned(
              top: 60,
              left: 20,
              right: 20,
              child: Container(
                height: 45,
                child: TextFormField(
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white) ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      )
                  ),
                  ),qq
              ),
            ) : SizedBox.shrink(),
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        const Icon(Icons.location_pin, color: Colors.red),
                        const SizedBox(width: 12),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(data: "Nairobi", color: Colors.white, fw: FontWeight.w700, size: 18),
                            AppText(data: "Good Morning", color: Colors.white, fw: FontWeight.w400, size: 14)
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _clicked = !_clicked;
                      });

                    },
                    icon: const Icon(Icons.search, color: Colors.white, size: 34),
                  ),
                ],
              ),
            ),
            Align(
              alignment: const Alignment(0, -0.7),
              child: Image.asset(imagePath[6]),
            ),
            Align(
              alignment: const Alignment(0, 0),
              child: Expanded(
                child: Container(
                  height: 130,
                  width: 130,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(data: "21 C", color: Colors.white, fw: FontWeight.bold, size: 32),
                      AppText(data: "Snow", color: Colors.white, fw: FontWeight.w600, size: 26),
                      AppText(data: DateTime.now().toString(), color: Colors.white)
                    ],
                  ),
                ),
              ),
            ),
            
            Align(
              alignment: const Alignment(0.0, 0.55),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black.withOpacity(0.4)
                ),
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/img/temperature-high.png", height: 30),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(data: "Temp Max", color: Colors.white, size: 14, fw: FontWeight.w600),
                                AppText(data: "21C", color: Colors.white, size: 14, fw: FontWeight.w600)
                              ],
                            )
                          ],
                        ),
                        const SizedBox(width: 12),
                        Row(
                          children: [
                            Image.asset("assets/img/temperature-low.png", height: 30),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(data: "Temp Min", color: Colors.white, size: 14, fw: FontWeight.w600),
                                AppText(data: "21C", color: Colors.white, size: 14, fw: FontWeight.w600)
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    CustomDivider(
                      startIndent: 20,
                      endIndent: 20,
                      color: Colors.white,
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/img/sun.png", height: 30),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(data: "Sunrise", color: Colors.white, size: 14, fw: FontWeight.w600),
                                AppText(data: "21C", color: Colors.white, size: 14, fw: FontWeight.w600)
                              ],
                            )
                          ],
                        ),
                        const SizedBox(width: 12),
                        Row(
                          children: [
                            Image.asset("assets/img/moon.png", height: 30),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(data: "Sunset", color: Colors.white, size: 14, fw: FontWeight.w600),
                                AppText(data: "21C", color: Colors.white, size: 14, fw: FontWeight.w600)
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
