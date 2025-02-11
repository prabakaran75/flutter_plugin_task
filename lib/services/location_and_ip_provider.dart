import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationAndIpProvider with ChangeNotifier {
  String? ipAddress;
  String? currentLocation;

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> fetchIPAddress() async {
    try {
      final response =
          await http.get(Uri.parse('https://api.ipify.org?format=json'));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        ipAddress = data['ip'];
      } else {
        throw Exception('Failed to load IP address');
      }
    } catch (e) {
      ipAddress = 'Unable to fetch IP';
      print(e.toString());
    }
    notifyListeners();
  }

  Future<void> fetchCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled.');
      }
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permission denied');
      }
      if (permission == LocationPermission.deniedForever) {
        throw Exception('Location permission permanently denied');
      }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks = await GeocodingPlatform.instance!
          .placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        currentLocation =
            '${placemark.locality}, ${placemark.country}'; // Example: 'New York, USA'
        notifyListeners();
      } else {
        currentLocation = 'Unable to retrieve location';
        notifyListeners();
      }
    } catch (e) {
      currentLocation = 'Error: ${e.toString()}';
      notifyListeners();
    }
  }
}
