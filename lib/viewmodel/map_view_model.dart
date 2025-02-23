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
