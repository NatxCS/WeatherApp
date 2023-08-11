import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  Future<bool> requestPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  Future<void> getCurrentLocation() async {
    try {
      bool hasPermission = await requestPermission();
      if (hasPermission) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        latitude = position.latitude;
        longitude = position.longitude;
        print("latitude = ${position.latitude}");
        print("latitude = ${position.longitude}");
      }
    } catch (e) {
      print(e);
    }
  }
}