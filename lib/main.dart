import 'package:flutter/material.dart';

void main() {
  runApp(const JoharGKApp());
}

class JoharGKApp extends StatelessWidget {
  const JoharGKApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Johar GK',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5DADE2),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> menuItems = const [
    {"icon": Icons.menu_book, "title": "Learn"},
    {"icon": Icons.quiz, "title": "Practice"},
    {"icon": Icons.emoji_events, "title": "Daily Quiz"},
    {"icon": Icons.fact_check, "title": "Mock Test"},
    {"icon": Icons.bookmark, "title": "Bookmarks"},
    {"icon": Icons.person, "title": "Profile"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF5DADE2),
                    Color(0xFFF5B041),
                  ],
                ),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.school,
                    color: Colors.white,
                    size: 70,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Johar GK",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Johar to Success!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: menuItems.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            menuItems[index]["icon"],
                            size: 50,
                            color: const Color(0xFF5DADE2),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            menuItems[index]["title"],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}