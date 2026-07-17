import 'package:flutter/material.dart';
import 'package:johar_gk/screens/tests/chapter_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late final List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = [
      const ChapterScreen(),
      _buildBattleHub(),
      _buildResultsHub(),
      _buildProfileHub(),
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
  // TAB 3: DYNAMIC RESULTS HISTORY LOG
  // =========================================================================
  Widget _buildResultsHub() {
    final List<Map<String, dynamic>> pastScores = [
      {
        'title': 'Introduction - Test 1',
        'score': '18/20',
        'date': 'Today',
        'passed': true,
      },
      {
        'title': 'History - Test 3',
        'score': '15/20',
        'date': 'Yesterday',
        'passed': true,
      },
      {
        'title': 'Geography - Test 1',
        'score': '08/20',
        'date': '2 days ago',
        'passed': false,
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Performance History',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
            'Review your answers and historical test report cards.',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: pastScores.length,
              itemBuilder: (context, index) {
                final run = pastScores[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.grey.shade200),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: run['passed']
                          ? Colors.green.shade50
                          : Colors.red.shade50,
                      child: Icon(
                        run['passed']
                            ? Icons.check_circle_outline
                            : Icons.highlight_off,
                        color: run['passed'] ? Colors.green : Colors.red,
                      ),
                    ),
                    title: Text(
                      run['title'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      run['date'],
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 12,
                      ),
                    ),
                    trailing: Text(
                      run['score'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: run['passed']
                            ? Colors.green.shade700
                            : Colors.red.shade700,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================================
  // TAB 4: UPGRADED ACCOUNT PROFILE VIEW
  // =========================================================================
  Widget _buildProfileHub() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 10),
          // User Avatar and Metadata Header
          const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.teal,
            child: Icon(Icons.person, size: 45, color: Colors.white),
          ),
          const SizedBox(height: 14),
          const Text(
            'Aspirant Account',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          const Text(
            'student.johar@gmail.com',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 26),

          // Premium validity status badge box
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal.shade600, Colors.teal.shade800],
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.workspace_premium,
                  color: Colors.amber,
                  size: 32,
                ),
                const SizedBox(width: 14),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PREMIUM PASS ACTIVE',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'Validity Remaining: 365 Days',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.teal.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Payment gateway opening simulation...'),
                      ),
                    );
                  },
                  child: const Text(
                    'Renew Plan',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Account Management List Settings Panels
          _buildProfileRowSetting(
            icon: Icons.settings,
            title: 'App Settings',
            trailingText: '',
          ),
          _buildProfileRowSetting(
            icon: Icons.language,
            title: 'Exam Language Preference',
            trailingText: 'English / Hindi',
          ),
          _buildProfileRowSetting(
            icon: Icons.help_outline,
            title: 'Help & Support Center',
            trailingText: '',
          ),
          _buildProfileRowSetting(
            icon: Icons.info_outline,
            title: 'About Johar GK v1.0',
            trailingText: '',
          ),

          const SizedBox(height: 15),
          // Logout Action Mock Row Button
          TextButton.icon(
            style: TextButton.styleFrom(foregroundColor: Colors.red[700]),
            onPressed: () {},
            icon: const Icon(Icons.logout),
            label: const Text(
              'Logout Account',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  // Helper template widget to quickly paint matching standard custom settings items
  Widget _buildProfileRowSetting({
    required IconData icon,
    required String title,
    required String trailingText,
  }) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade100),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal[800]),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (trailingText.isNotEmpty)
              Text(
                trailingText,
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
            const SizedBox(width: 4),
            const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}
