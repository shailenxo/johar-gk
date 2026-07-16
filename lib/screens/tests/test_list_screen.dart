import 'package:flutter/material.dart';
import 'quiz_screen.dart'; // This connects it to your 15-minute quiz engine!

class TestListScreen extends StatelessWidget {
  final String chapterName;

  const TestListScreen({super.key, required this.chapterName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(title: Text(chapterName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select a Mock Test",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              "Each test has 20 questions • 15 minutes",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columns of test cards
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 1.4, // Compact rectanglular cards
                ),
                itemCount: 20, // Exactly 20 tests per chapter!
                itemBuilder: (context, index) {
                  int testNumber = index + 1;
                  return InkWell(
                    onTap: () {
                      // Opens up the live quiz engine for this specific test
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            chapterTitle: "$chapterName - Test $testNumber",
                          ),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.quiz_outlined,
                            color: Colors.teal[700],
                            size: 28,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Test $testNumber",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
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
