import 'package:flutter/material.dart';
import 'package:mimiq_dance/models/studio_info_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mimiq_dance/views/studio_info_page.dart';

class MapView extends StatelessWidget {
  MapView({super.key});

  List<StudioInfoModel> studios = [];

  void _getStudioInfo() {
    studios = StudioInfoModel.getStudiosInfo();
  }

  final LatLng _center = const LatLng(41.850033, -87.6500523);
  
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
          zoom: 5.0,
        ),
        markers: {
          Marker(
               markerId: MarkerId(studios[0].name),
               position: const LatLng(42.714040,-82.589822),
               onTap: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => StudioInfoView(studioModel: studios[0]))
                )
              }
            ), 
          Marker(
            markerId: MarkerId(studios[2].name),
            position: const LatLng(42.792011,-90.882680),
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => StudioInfoView(studioModel: studios[2]))
              )
            }
          ), 
          Marker(
              markerId: MarkerId(studios[3].name),
              position: const LatLng(35.197642,-80.787244),
              onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => StudioInfoView(studioModel: studios[3]))
              )
            }
            ),
          
      }, // markers

      )
    );
  }
}