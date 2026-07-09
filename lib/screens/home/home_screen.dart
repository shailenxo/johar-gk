import '../learn/learn_screen.dart';
import '../../widgets/feature_card.dart';
import '../../core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Johar GK',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Johar! 👋',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Johar to Success!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade700,
              ),
            ),

            const SizedBox(height: 30),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  FeatureCard(icon: Icons.menu_book,
  title: 'Learn',
  color: AppColors.learn,
  onTap: () {

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const LearnScreen(),
    ),
  );
  },
  ),
                  FeatureCard(
  icon: Icons.edit_note,
  title: 'Practice',
  color: AppColors.practice,
  onTap: () {},
  ),
                  FeatureCard(icon: Icons.quiz,
  title: 'Mock Test',
  color: AppColors.quiz,
  onTap: () {},
  ),
                  FeatureCard(
  icon: Icons.bookmark,
  title: 'Bookmarks',
  color: AppColors.bookmark,
  onTap: () {},
  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.school),
            label: 'Learn',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

