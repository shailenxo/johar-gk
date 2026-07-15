import 'package:flutter/material.dart';

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
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${chapters[index]} selected")),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
