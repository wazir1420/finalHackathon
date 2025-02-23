import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

class MapViewModel extends BaseViewModel {
  // Coordinates for Googleplex
  static const LatLng pGooglePlex = LatLng(37.4223, -122.0848);

  // Initial camera position focused on Googleplex
  CameraPosition get initialCameraPosition => const CameraPosition(
        target: pGooglePlex, // Center the map on Googleplex
        zoom: 14, // Zoom level
      );
}
