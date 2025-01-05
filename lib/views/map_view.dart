import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mimiq_dance/models/studio_info_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mimiq_dance/views/studio_info_page.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  Set<Marker> _markers = {};

  @override
  void initState() {
    _getStudioLocalisation();
    super.initState();
  }

  void _getStudioLocalisation() async {
    List<StudioInfoModel> fetchedData = await StudioInfoModel.getStudiosInfo();
    Set<Marker> markers = {};

    for (var e in fetchedData) {
      markers.add(
              Marker(
                markerId: MarkerId(e.name),
                position: e.localisation,
              ),);
    }
              
    setState(() {
      _markers = markers;
    });
  }

  final LatLng _center = const LatLng(41.850033, -87.6500523);
  
  @override
  Widget build(BuildContext context) {
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
          zoom: 5.0,
        ),
        markers: _markers,
      )
    );
  }
}