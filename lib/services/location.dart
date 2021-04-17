import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;

  Future<void> geCurrentLocation() async {
    try {
      Position p = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      longitude = p.longitude;
      latitude = p.latitude;
    } catch (e) {
      print('Exception in getting location $e');
    }
  }
}
