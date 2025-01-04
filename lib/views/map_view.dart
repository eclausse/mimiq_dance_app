import 'package:flutter/material.dart';
import 'package:mimiq_dance/models/studio_info_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatelessWidget {
  MapView({super.key});

  List<StudioInfoModel> studios = [];

  void _getStudioInfo() {
    studios = StudioInfoModel.getStudiosInfo();
  }

  final LatLng _center = const LatLng(-33, 151);
  
  @override
  Widget build(BuildContext context) {
    // Get the list of studios
    _getStudioInfo();

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Center(
          child: Text("Map"),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      )
    );
  }
}