import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mimiq_dance/models/studio_category_model.dart';

class StudioInfoModel {
  String name;
  String address;
  String description;
  StudioCategory category;
  LatLng localisation;

  StudioInfoModel({
    required this.name,
    required this.address,
    required this.description,
    required this.category,
    required this.localisation
  });

  static Future<List<StudioInfoModel>> getStudiosInfo() async {
    List<StudioInfoModel> studiosInfo = [];

    await FirebaseFirestore.instance.collection('studio').get().then(
        (snapshot) => snapshot.docs.forEach(
          (element) {
            Map<String, dynamic> data = element.data();
            LatLng loc = LatLng(data['latitude'], data['longitude']);
            StudioInfoModel studio = StudioInfoModel(name: data['name'], address: data['address'], description: data['description'], category: StudioCategory.values.firstWhere((e) => e.toString() == 'StudioCategory.' + data['category']), localisation: loc);
            studiosInfo.add(studio);
          })
    );
    return studiosInfo;
  }
}