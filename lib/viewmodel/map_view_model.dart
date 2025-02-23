import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

class MapViewModel extends BaseViewModel {
  LatLng _currentLocation = const LatLng(24.8135, 66.9988);
  String _address = 'Karachi';
  final Set<Marker> _markers = {};

  LatLng get currentLocation => _currentLocation;
  String get address => _address;
  Set<Marker> get markers => _markers;

  MapViewModel() {
    _addMarker(_currentLocation, _address);
  }

  Future<void> setMarker(LatLng value) async {
    debugPrint('Setting marker at: ${value.latitude}, ${value.longitude}');
    try {
      List<Placemark> result =
          await placemarkFromCoordinates(value.latitude, value.longitude);
      if (result.isNotEmpty) {
        _currentLocation = value;
        _address =
            '${result[0].name}, ${result[0].locality}, ${result[0].administrativeArea}';
        _markers.clear();
        _addMarker(_currentLocation, _address);
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Geocoding error: $e');
    }
  }

  Future<List<String>> getLocationSuggestions(String query) async {
    try {
      debugPrint('Fetching suggestions for query: $query');
      List<Location> locations = await locationFromAddress(query);
      debugPrint('Locations found: ${locations.length}');

      List<String> addresses = [];
      for (var location in locations) {
        List<Placemark> placemarks = await placemarkFromCoordinates(
          location.latitude,
          location.longitude,
        );
        if (placemarks.isNotEmpty) {
          Placemark placemark = placemarks.first;
          String address =
              '${placemark.name}, ${placemark.locality}, ${placemark.administrativeArea}';
          addresses.add(address);
        }
      }

      return addresses;
    } catch (e) {
      debugPrint('Location suggestions error: $e');
      return [];
    }
  }

  Future<void> searchLocation(String query, BuildContext context) async {
    try {
      debugPrint('Searching for location: $query');
      List<Location> locations = await locationFromAddress(query);
      if (locations.isNotEmpty) {
        LatLng newLocation =
            LatLng(locations[0].latitude, locations[0].longitude);
        setMarker(newLocation);

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Location found: $query',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.grey.shade300,
          ),
        );
      } else {
        debugPrint('No locations found for query: $query');
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No locations found for: $query'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      debugPrint('Location search error: $e');
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _addMarker(LatLng position, String address) {
    _markers.add(
      Marker(
        markerId: const MarkerId('current_location'),
        position: position,
        draggable: true,
        infoWindow: InfoWindow(title: address),
        onDragEnd: (value) {
          setMarker(value);
        },
      ),
    );
  }
}
