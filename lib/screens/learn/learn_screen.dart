import 'package:flutter/material.dart';
import 'package:johar_gk/screens/learn/introduction_screen.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  static const List<String> chapters = [
    'Introduction',
    'History',
    'Geography',
    'Districts',
    'Rivers',
    'Waterfalls',
    'Minerals',
    'National Parks',
    'Wildlife',
    'Tribes',
    'Art & Culture',
    'Festivals',
    'Economy',
    'Government',
    'Important Personalities',
    'Current Affairs',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Learn Jharkhand GK')),
      body: ListView.builder(
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.menu_book),
            title: Text(chapters[index]),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IntroductionScreen(),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${chapters[index]} - Coming Soon')),
                );
              }
            },
          );
        },
      ),
    );
  }
}
