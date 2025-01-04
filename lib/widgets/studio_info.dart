import 'package:flutter/material.dart';

import '../models/studio_info_model.dart';

class StudioInfo extends StatelessWidget {
  const StudioInfo({super.key,
    required this.studioModel
  });

  final StudioInfoModel studioModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(studioModel.name),
    );
  }
}