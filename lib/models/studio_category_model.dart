enum StudioCategory {
  freestyle, jazz, ballet
}

class StudioCategoryModel {
  static List<StudioCategory> getAllStudioCategory() {
    return StudioCategory.values;
  }
}