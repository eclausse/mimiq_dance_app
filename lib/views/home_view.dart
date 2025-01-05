import 'package:flutter/material.dart';
import 'package:mimiq_dance/models/studio_category_model.dart';
import 'package:mimiq_dance/models/studio_info_model.dart';
import 'package:mimiq_dance/views/map_view.dart';
import 'package:mimiq_dance/widgets/studio_info.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<StudioInfoModel> _allStudios = [];
  List<StudioInfoModel> _foundStudios = [];
  String _searchQuery = '';

  List<StudioCategory> _allCategories = [];
  List<DropdownMenuEntry> _allCategoriesEntry = [];
  String _categorySelected= 'none';

  @override
  void initState() {
    _allStudios = StudioInfoModel.getStudiosInfo();
    _foundStudios = List.from(_allStudios);

    _allCategories = StudioCategoryModel.getAllStudioCategory();

    // Process StudioCategory as Entry
    _allCategoriesEntry.add(const DropdownMenuEntry(value: "none", label: "No selection"));
    _allCategoriesEntry.addAll(_allCategories.map((e) => DropdownMenuEntry(value: e.name, label: e.name)).toList());

    super.initState();
  }

  void _updateSearchQuery(String enteredKeyword) {
    setState(() {
      _searchQuery = enteredKeyword;
    });
    _runFilter();
  }

  void _updateCategory(String categorySelected) {
    setState(() {
      _categorySelected = categorySelected;
    });
    _runFilter();
  }

  void _runFilter() {
    List<StudioInfoModel> result = [];

    result = _allStudios
                .where((element) => 
                  element.category.name == _categorySelected || _categorySelected == "none")
                .where((element) => 
                  element.name.toLowerCase().contains(_searchQuery.toLowerCase()),)
                .toList();
    
    setState(() {
      _foundStudios = result;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Center(
              child: Text("Dance Studio Application Demo"),
            ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: TextField(
                      onChanged: (value) => _updateSearchQuery(value),
                      decoration: const InputDecoration(
                        labelText: "Search",
                        suffixIcon: Icon(Icons.search),
                    )),
                  ),
                  Expanded(
                    flex: 1,
                    child: DropdownMenu(
                      hintText: "Choose a category",
                      dropdownMenuEntries: _allCategoriesEntry,
                      onSelected: (value) => _updateCategory(value),
                    ),
                  )
                ]
              )
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _foundStudios.length,
                itemBuilder: (context, index) {
                  return StudioInfo(studioModel: _foundStudios[index]);
                })
            )
          ]),
      ), 
    );
  }
}