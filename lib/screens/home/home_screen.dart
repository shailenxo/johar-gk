import 'package:flutter/material.dart';
import 'package:johar_gk/screens/tests/chapter_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0E15),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0E15),
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&w=100&q=80',
            ),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alex J.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // FIXED: Updated top right header tracking texts
                Text(
                  'JOHAR',
                  style: TextStyle(
                    color: Color(0xFFFF2A6D),
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    letterSpacing: 1,
                  ),
                ),
                Text(
                  'GK',
                  style: TextStyle(
                    color: Color(0xFF05D9E8),
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: _currentIndex == 0
            ? _buildNeonGridDashboard()
            : const Center(
                child: Text(
                  'Sub Tab View Active',
                  style: TextStyle(color: Colors.white),
                ),
              ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: const Color(0xFF0D0E15)),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: const Color(0xFF0D0E15),
          selectedItemColor: const Color(0xFFFF2A6D),
          unselectedItemColor: Colors.grey[600],
          type: BottomNavigationBarType.fixed,
          onTap: (index) => setState(() => _currentIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit_note),
              label: 'Practice',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events_outlined),
              label: 'Leaderboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNeonGridDashboard() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.85,
        children: [
          _buildQuantumCard(
            title: 'START TEST',
            subtitle: 'Current:\nMock Exam 4.1',
            icon: Icons.timer_outlined,
            glowColor: const Color(0xFF05D9E8),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChapterScreen()),
              );
            },
          ),
          _buildQuantumCard(
            title: 'BATTLE ROYALE',
            subtitle: 'Live: Challenge Friends!\nNext Match in 2m 15s',
            icon: Icons.local_fire_department_outlined,
            glowColor: const Color(0xFFFF2A6D),
            onTap: () {},
          ),
          _buildQuantumCard(
            title: 'VIEW RESULTS',
            subtitle: 'Latest Score: 85%\nRank: Top 5%',
            icon: Icons.emoji_events_outlined,
            glowColor: const Color(0xFFB10DC9),
            onTap: () {},
          ),
          _buildQuantumCard(
            title: 'MY PROFILE',
            subtitle: 'Level 18 | 4500 XP',
            icon: Icons.account_circle_outlined,
            glowColor: const Color(0xFF01FF70),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildQuantumCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color glowColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF161925),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: glowColor.withValues(alpha: 0.8),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: glowColor.withValues(alpha: 0.2),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: glowColor, size: 44),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 11,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
