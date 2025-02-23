import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  static LatLng cliftonBeach = const LatLng(24.8135, 66.9988);
  String address = 'Karachi';

  Future<void> setMarker(LatLng value) async {
    debugPrint('Setting marker at: ${value.latitude}, ${value.longitude}');
    try {
      List<Placemark> result =
          await placemarkFromCoordinates(value.latitude, value.longitude);
      if (result.isNotEmpty) {
        debugPrint(
            'Address: ${result[0].name}, ${result[0].locality}, ${result[0].administrativeArea}');
        setState(() {
          cliftonBeach = value;
          address =
              '${result[0].name}, ${result[0].locality}, ${result[0].administrativeArea}';
        });
      }
    } catch (e) {
      debugPrint('Geocoding error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to fetch address: $e')),
      );
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(address)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: cliftonBeach,
          zoom: 12,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('1'),
            position: cliftonBeach,
            draggable: true,
            infoWindow: InfoWindow(title: address),
            onDragEnd: (value) {
              setMarker(value);
            },
          ),
        },
        onTap: (value) {
          setMarker(value);
        },
      ),
    );
  }
}
