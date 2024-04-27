import 'package:flutter/material.dart';
import 'package:fly_app/Dynamic_Form/dynamic_form.dart';
import 'package:fly_app/animatioflutter/screens/homepage.dart';
import 'package:fly_app/dropdown/home_page.dart';
import 'package:fly_app/onboardingApp/onboarding_screen.dart';
// import 'package:fly_app/Screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:   const AnimationHomePage(),
    );
  }
}
