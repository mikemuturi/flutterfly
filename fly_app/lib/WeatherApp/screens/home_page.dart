import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({Key? key});

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  bool _clicked = false;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<LocationProvider>(context, listen: false).determinePosition();
    });
    super.initState();
  }

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
      body: Consumer<LocationProvider>(
        builder: (context, provider, _) {
          if (provider.currentPosition == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return buildWeatherUI(size);
          }
        },
      ),
    );
  }

  Widget buildWeatherUI(Size size) {
    return Container(
      padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('background[0]'),
        ),
      ),
      child: Stack(
        children: [
          _clicked == true
              ? Positioned(
                  top: 60,
                  left: 20,
                  right: 20,
                  child: Container(
                    height: 45,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink(),
          // Other widgets in the Stack...
        ],
      ),
    );
  }
}

class LocationProvider with ChangeNotifier {
  Position? _currentPosition;
  Position? get currentPosition => _currentPosition;

  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      _currentPosition = null;
      notifyListeners();
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) ;

    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      _currentPosition = null;

      notifyListeners();
      return;
    }
  }
}
