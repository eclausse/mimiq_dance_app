import 'package:flutter/material.dart';
import 'package:mimiq_dance/models/studio_info_model.dart';
import 'package:mimiq_dance/views/map_view.dart';
import 'package:mimiq_dance/widgets/studio_info.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  List<StudioInfoModel> studios = [];

  void _getStudioInfo() {
    studios = StudioInfoModel.getStudiosInfo();
  }
  
  @override
  Widget build(BuildContext context) {
    // Get the list of studios
    _getStudioInfo();

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: Stack(
          children: [
            const Align(
              child: Text("Dance Studio Application Demo"),
            ),
            Positioned(
              right: 0,
              child: GestureDetector(
                child: const Text("Map"),
                onTap: () => {
                  Navigator.of(context).push( MaterialPageRoute(builder: (context) => MapView()))
                  }
                )
              )
          ]),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: studios.length,
        itemBuilder: (context, index) {
          return StudioInfo(studioModel: studios[index]);
        }
      ),
    );
  }
}