import 'package:flutter/material.dart';
import 'test_list_screen.dart'; // Import our new 20 tests screen!

class ChapterScreen extends StatelessWidget {
  const ChapterScreen({super.key});

  final List<String> chapters = const [
    "Introduction",
    "History",
    "Geography",
    "Districts",
    "Rivers",
    "Waterfalls",
    "Minerals",
    "National Parks",
    "Wildlife",
    "Tribes",
    "Art & Culture",
    "Festivals",
    "Economy",
    "Government",
    "Important Personalities",
    "Current Affairs",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Chapter")),
      body: ListView.builder(
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(child: Text("${index + 1}")),
              title: Text(chapters[index]),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // 🌟 Navigate to the 20 tests grid for the selected chapter
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TestListScreen(chapterName: chapters[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
