import 'package:flutter/material.dart';
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
  String searchQuery = '';

  @override
  void initState() {
    _allStudios = StudioInfoModel.getStudiosInfo();
    _foundStudios = List.from(_allStudios);
    super.initState();
  }

  void _updateSearchQuery(String enteredKeyword) {
    setState(() {
      searchQuery = enteredKeyword;
    });
    _runFilter();
  }

  void _runFilter() {
    List<StudioInfoModel> result = [];

    result = _allStudios
                .where((element) => 
                  element.name.toLowerCase().contains(searchQuery.toLowerCase()),)
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
            TextField(
              onChanged: (value) => _updateSearchQuery(value),
              decoration: const InputDecoration(
                labelText: "Search",
                suffixIcon: Icon(Icons.search),
              ),
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