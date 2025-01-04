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

    studiosInfo.add(
      StudioInfoModel(name: "Harmony Arts Collective", 
        address: "78 Harmony Avenue, Serenaville, TX 73301", 
        description: "Offering ballet, jazz, and modern dance classes, this studio also incorporates yoga and Pilates into its curriculum to promote holistic movement training.")
    );

    studiosInfo.add(
      StudioInfoModel(name: "Velocity Performing Arts Center", 
        address: "12 Energy Drive, Momentum City, IL 60601", 
        description: "A state-of-the-art facility that teaches ballet, tap, jazz, and musical theater, as well as choreography workshops for aspiring dancers.")
    );

    studiosInfo.add(
      StudioInfoModel(name: "Groove Dynamics Studio", 
        address: "67 Rhythm Road, Flowtown, FL 33101", 
        description: "Known for its vibrant atmosphere, this studio offers classes in hip-hop, K-pop choreography, and freestyle dance, with a focus on building confidence and creativity.")
    );

    return studiosInfo;
  }
}