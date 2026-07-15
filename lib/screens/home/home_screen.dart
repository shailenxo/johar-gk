import 'package:flutter/material.dart';
import 'package:johar_gk/screens/tests/chapter_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // The 4 screens matching your tabs exactly
  late final List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = [
      const ChapterScreen(), // Tab 1 opens your core Chapter-wise Mock Tests directly!
      _buildBattleHub(), // Tab 2: Battle Royale
      _buildResultsHub(), // Tab 3: Results Repository
      _buildProfileHub(), // Tab 4: Profile & Validity
    ];
  }

  @override
  Widget build(BuildContext context) {
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
          NavigationDestination(icon: Icon(Icons.assignment), label: 'Test'),
          NavigationDestination(icon: Icon(Icons.bolt), label: 'Battle Royale'),
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
  // TAB 2: BATTLE ROYALE SCREEN
  // =========================================================================
  Widget _buildBattleHub() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Battle Royale Room',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
            'Challenge other aspirants live on identical test sheets.',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 30),
          _buildActionCard(
            title: 'Challenge a Friend',
            description: 'Generate a room code and play dynamic sets together.',
            icon: Icons.groups,
            color: Colors.deepPurple,
            actionLabel: 'Create Room',
          ),
          const SizedBox(height: 20),
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

  // Helper widget to easily draw clean battle action cards
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
  // TAB 3: RESULTS SCREEN
  // =========================================================================
  Widget _buildResultsHub() {
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
            'Performance Repository',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            'Live dynamic scores & ranks will sort here.',
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  // =========================================================================
  // TAB 4: PROFILE SCREEN WITH VALIDITY
  // =========================================================================
  Widget _buildProfileHub() {
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
