import 'package:flutter/material.dart';
import 'package:johar_gk/screens/tests/chapter_screen.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/feature_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // The 4 distinct tabs engine
  late final List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = [
      _buildHomeTestDashboard(),
      _buildBattleHub(),
      _buildResultsDashboard(),
      _buildProfileDashboard(),
    ];
  }

  @override
  Widget build(BuildContext voidContext) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Johar GK',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(child: _tabs[_currentIndex]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.menu_book), label: 'Tests'),
          NavigationDestination(icon: Icon(Icons.bolt), label: 'Battle'),
          NavigationDestination(
            icon: Icon(Icons.emoji_events),
            label: 'Results',
          ),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  // =========================================================================
  // TAB 1: TESTS DASHBOARD (Your Original Grid UI adapted for the tab)
  // =========================================================================
  Widget _buildHomeTestDashboard() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Johar! 👋',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Johar to Success!',
            style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                FeatureCard(
                  icon: Icons.menu_book,
                  title: 'Learn',
                  color: AppColors.learn,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChapterScreen(),
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
                FeatureCard(
                  icon: Icons.quiz,
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
    );
  }

  // =========================================================================
  // TAB 2: BATTLE ROYALE HUB
  // =========================================================================
  Widget _buildBattleHub() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Battle Royale',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            'Compete live with real aspirants.',
            style: TextStyle(color: Colors.grey.shade700),
          ),
          const SizedBox(height: 30),

          // Action Card 1: Friends Invite Duel
          _buildActionCard(
            title: 'Challenge a Friend',
            description: 'Generate a room code and play dynamic sets together.',
            icon: Icons.groups,
            color: Colors.deepPurple,
            actionLabel: 'Create Room',
          ),
          const SizedBox(height: 20),

          // Action Card 2: Matchmaking
          _buildActionCard(
            title: 'Random Matchmaking',
            description:
                'Instantly match with any active student online right now.',
            icon: Icons.flash_on,
            color: Colors.amber.shade800,
            actionLabel: 'Find Match',
          ),
        ],
      ),
    );
  }

  // Helper Widget for Clean Battle Cards
  Widget _buildActionCard({
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required String actionLabel,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(actionLabel),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =========================================================================
  // TAB 3: LIVE RESULTS REPOSITORY
  // =========================================================================
  Widget _buildResultsDashboard() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.emoji_events_outlined,
            size: 64,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 12),
          const Text(
            'Performance & Ranks',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            'Live dynamic scores will sort here.',
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  // =========================================================================
  // TAB 4: PROFILE & SUBSCRIPTION VALIDITY
  // =========================================================================
  Widget _buildProfileDashboard() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 36,
            backgroundColor: Colors.blueGrey,
            child: Icon(Icons.person, size: 40, color: Colors.white),
          ),
          const SizedBox(height: 12),
          const Text(
            'Aspirant Account',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 24),

          // Premium validity status widget box
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal.shade600, Colors.teal.shade800],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Icon(Icons.workspace_premium, color: Colors.amber, size: 28),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PREMIUM ACCESSIBILITY ACTIVE',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Validity Left: 365 Days',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
