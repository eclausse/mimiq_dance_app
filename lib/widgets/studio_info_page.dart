import 'package:flutter/material.dart';

import '../models/studio_info_model.dart';

class StudioInfoPage extends StatelessWidget {
  const StudioInfoPage({super.key,
    required this.studioModel
  });

  final StudioInfoModel studioModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(studioModel.name),
          Text(studioModel.address),
          Text(studioModel.description),
          const Spacer(),
          IconButton(
            onPressed: () => {
              Navigator.pop(context)
            }, 
            icon: const Icon(Icons.arrow_back),
            )
        ])
    );
  }
}