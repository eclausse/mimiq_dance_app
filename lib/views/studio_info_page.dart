import 'package:flutter/material.dart';

import '../models/studio_info_model.dart';

class StudioInfoView extends StatelessWidget {
  const StudioInfoView({super.key,
    required this.studioModel
  });

  final StudioInfoModel studioModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: Center(
          child: Text(studioModel.name),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(studioModel.description,
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Address: ${studioModel.address}",
                style: const TextStyle(fontSize: 20),
              )
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Book now'),
                      content: const Text(
                        'You are about to book a class.'
                      ),
                      actions: <Widget>[
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                          ),
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                          ),
                          child: const Text('Book'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );}
                  );
                },
              child: const Text("Book now"),
            ),
          ])
        )
    );
  }
}