import 'package:finalhackathon/viewmodel/map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MapViewModel>.reactive(
      viewModelBuilder: () => MapViewModel(),
      onViewModelReady: (viewModel) {
        viewModel.addListener(() {
          if (viewModel.address.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  viewModel.address,
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.grey.shade300,
              ),
            );
          }
        });
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          body: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: viewModel.currentLocation,
              zoom: 12,
            ),
            markers: viewModel.markers,
            onTap: (value) {
              viewModel.setMarker(value);
            },
          ),
        );
      },
    );
  }
}
