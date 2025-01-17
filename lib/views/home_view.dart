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
  final List<DropdownMenuEntry> _allCategoriesEntry = [];
  String _categorySelected= 'none';

  @override
  void initState() {
    _fetchStudioData();

    _allCategories = StudioCategoryModel.getAllStudioCategory();

    // Process StudioCategory as Entry
    _allCategoriesEntry.add(const DropdownMenuEntry(value: "none", label: "No selection"));
    _allCategoriesEntry.addAll(_allCategories.map((e) => DropdownMenuEntry(value: e.name, label: e.name)).toList());

    super.initState();
  }

  void _fetchStudioData() async {
      List<StudioInfoModel> data = await StudioInfoModel.getStudiosInfo();
      setState(() {
        _allStudios = data;
        _foundStudios = List.from(_allStudios);
      });
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
                left: 300,
                right: 300,
              ),
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: TextField(
                          onChanged: (value) => _updateSearchQuery(value),
                          decoration: const InputDecoration(
                            labelText: "Search",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.search),
                        )),
                      ),
                      const SizedBox(width: 50),
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
                )
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