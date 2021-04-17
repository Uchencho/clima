import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

const baseURL = "api.openweathermap.org";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location l = Location();
    await l.geCurrentLocation();

    NetworkHelper weather = NetworkHelper(
      baseURL: baseURL,
      longitude: l.longitude,
      latitude: l.latitude,
    );
    var result = await weather.getData();
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
