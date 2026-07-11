import 'package:flutter/material.dart';
import '../../home/screens/CustomBottomNavBar.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.insert_drive_file_outlined),
      ),
      body: const Column(children: [Text("Test Screen")]),

      bottomNavigationBar: const CustomBottomNavBar(
        currentIndex: 1, // Journal screen
      ),
    );
  }
}
