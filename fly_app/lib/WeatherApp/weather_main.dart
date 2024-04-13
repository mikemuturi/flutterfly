import 'package:flutter/material.dart';
import 'package:fly_app/WeatherApp/screens/home_page.dart';
import 'package:fly_app/WeatherApp/services/location_provider.dart';
import 'package:provider/provider.dart';

class WeatherMainApp extends StatelessWidget {
  const WeatherMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocationProvider12()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const WeatherHomePage(),
      ),
    );
  }
}
