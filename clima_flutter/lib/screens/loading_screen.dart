import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool serviceEnabled;
  LocationPermission permission;
  LocationSettings locationSettings;

  var url; //to fetch a data from a web server via URI-url in the getData();

  void getLocationData() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission(); //**
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LocationScreen(weatherData: weatherData)));
  }

  //the location of user will be printed as soon as the app is loaded (the stateful widget is created);
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.blue,
          size: 100.0,
          //duration: Duration(milliseconds: 3000),
        ),
      ),
    );
  }
}
