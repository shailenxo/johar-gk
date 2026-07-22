import 'package:flutter/material.dart';
import 'package:johar_gk/screens/tests/chapter_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Get current logged-in Supabase user
  User? get currentUser => Supabase.instance.client.auth.currentUser;

  // Get User Display Name (or fallback to email/phone)
  String get _userName {
    final meta = currentUser?.userMetadata;
    if (meta != null && meta['full_name'] != null) {
      return meta['full_name'];
    } else if (currentUser?.email != null) {
      return currentUser!.email!.split('@').first;
    } else if (currentUser?.phone != null) {
      return currentUser!.phone!;
    }
    return 'User';
  }

  // Get User Profile Image (or fallback to placeholder)
  String get _userAvatarUrl {
    final meta = currentUser?.userMetadata;
    if (meta != null && meta['avatar_url'] != null) {
      return meta['avatar_url'];
    }
    return 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&w=100&q=80';
  }

  // Sign out function
  Future<void> _signOut() async {
    await Supabase.instance.client.auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0E15),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0E15),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(_userAvatarUrl),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _userName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          // Sign Out Button
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.grey),
            tooltip: 'Sign Out',
            onPressed: _signOut,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
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
