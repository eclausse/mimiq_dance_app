import 'package:flutter/material.dart';
import 'package:mimiq_dance/widgets/studio_info_page.dart';

import '../models/studio_info_model.dart';

class StudioInfo extends StatelessWidget {
  const StudioInfo({super.key,
    required this.studioModel
  });

  final StudioInfoModel studioModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 0,
          left: 20,
          right: 20,
        ),
        child: Card(
          child: SizedBox(
            height: 100,
            child: Center(child: Text(studioModel.name)),
          ),
        ),
      ),
      onTap: () => {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => StudioInfoPage(studioModel: studioModel))
        )
      },
    );
  }
}