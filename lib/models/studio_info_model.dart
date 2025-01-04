class StudioInfoModel {
  String name;
  String address;
  String description;

  StudioInfoModel({
    required this.name,
    required this.address,
    required this.description,
  });

  static List<StudioInfoModel> getStudiosInfo() {
    List<StudioInfoModel> studiosInfo = [];

    studiosInfo.add(
      StudioInfoModel(name: "Eclipse Dance Academy", 
        address: "123 Crescent Lane, Starville, NY 10001", 
        description: "This studio offers ballet, hip-hop, contemporary, and salsa dance classes for all ages. It features spacious studios, expert instructors, and an inclusive environment.")
    );

    studiosInfo.add(
      StudioInfoModel(name: "Rhythm & Motion Studio", 
        address: "45 Groove Street, Beatown, CA 90210", 
        description: "Specializing in urban and street dance styles, this studio provides breakdancing, hip-hop, and popping classes, along with fitness dance programs like Zumba and Afrobeat.")
    );

    return studiosInfo;
  }
}