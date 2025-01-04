import 'package:flutter/material.dart';
import 'package:mimiq_dance/models/studio_info_model.dart';
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
      body: ListView.builder(
        itemCount: studios.length,
        itemBuilder: (context, index) {
          return StudioInfo(studioModel: studios[index]);
        }
      ),
    );
  }
}