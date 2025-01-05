import 'package:mimiq_dance/models/studio_category_model.dart';

class StudioInfoModel {
  String name;
  String address;
  String description;
  StudioCategory category;

  StudioInfoModel({
    required this.name,
    required this.address,
    required this.description,
    required this.category,
  });

  static List<StudioInfoModel> getStudiosInfo() {
    List<StudioInfoModel> studiosInfo = [];

    studiosInfo.add(
      StudioInfoModel(name: "Eclipse Dance Academy", 
        address: "123 Crescent Lane, Starville, NY 10001", 
        description: "This studio offers ballet classes for all ages. It features spacious studios, expert instructors, and an inclusive environment.",
        category: StudioCategory.ballet)
    );

    studiosInfo.add(
      StudioInfoModel(name: "Rhythm & Motion Studio", 
        address: "45 Groove Street, Beatown, CA 90210", 
        description: "Specializing in urban and street dance styles, this studio provides freestyle classes, along with fitness dance programs.",
        category: StudioCategory.freestyle)
    );

    studiosInfo.add(
      StudioInfoModel(name: "Harmony Arts Collective", 
        address: "78 Harmony Avenue, Serenaville, TX 73301", 
        description: "Offering jazz classes, this studio also incorporates yoga and Pilates into its curriculum to promote holistic movement training.",
        category: StudioCategory.jazz)
    );

    studiosInfo.add(
      StudioInfoModel(name: "Velocity Performing Arts Center", 
        address: "12 Energy Drive, Momentum City, IL 60601", 
        description: "A state-of-the-art facility that teaches ballet, as well as choreography workshops for aspiring dancers.",
        category: StudioCategory.ballet)
    );

    studiosInfo.add(
      StudioInfoModel(name: "Groove Dynamics Studio", 
        address: "67 Rhythm Road, Flowtown, FL 33101", 
        description: "Known for its vibrant atmosphere, this studio offers classes in freestyle dance, with a focus on building confidence and creativity.",
        category: StudioCategory.freestyle)
    );

    return studiosInfo;
  }
}