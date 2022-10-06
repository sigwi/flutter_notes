import 'package:flutter/material.dart';
import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';
import 'package:clima_flutter/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? lat;
  double? long;
  String apiKey = 'bce79400f996839f74bfbff360c1fb7e';

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location loc = Location();
    await loc.getCurrentLocation();
    lat = loc.latitude;
    long = loc.longitude;
    print(lat);
    print(long);

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(weatherData);
        },
      ),
    );

    var tempt = weatherData['main']['temp'];
    print('Temperatur = $tempt');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
