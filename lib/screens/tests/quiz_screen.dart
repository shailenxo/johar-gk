import 'dart:async';
import 'package:flutter/material.dart';
import 'question_bank.dart'; // Handles the 4x question repetition engine

class QuizScreen extends StatefulWidget {
  final String chapterTitle;
  const QuizScreen({super.key, required this.chapterTitle});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // Timer settings: 15 minutes = 900 seconds
  int _secondsRemaining = 900;
  Timer? _timer;

  int _currentQuestionIndex = 0;

  // Track user selections (-1 means unattempted)
  final List<int> _selectedAnswers = List.generate(20, (index) => -1);

  // Dynamic question list filled by the repetition engine
  late final List<Map<String, dynamic>> _questions;

  @override
  void initState() {
    super.initState();

    // Extract Chapter name and Test number safely from the title string
    List<String> parts = widget.chapterTitle.split(" - Test ");
    String chName = parts[0];
    int testNum = parts.length > 1 ? int.parse(parts[1]) : 1;

    // Fetch the smart-repeated question set for this specific test
    _questions = QuestionBank.getQuestionsForTest(chName, testNum);

    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer?.cancel();
          _submitQuiz(autoSubmit: true);
        }
      });
    });
  }

  String _formatTime(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void _submitQuiz({bool autoSubmit = false}) {
    _timer?.cancel();

    // Calculate performance metrics
    int attempted = _selectedAnswers.where((index) => index != -1).length;
    int score = 0;
    for (int i = 0; i < _questions.length; i++) {
      if (_selectedAnswers[i] == _questions[i]['correctIndex']) {
        score++;
      }
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(autoSubmit ? 'Time Out!' : 'Test Completed'),
        content: Text(
          'Your Score: $score/20\nAttempted: $attempted\nLeft: ${20 - attempted}',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Exit quiz screen back to dashboard
            },
            child: const Text('Go Back'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int attemptedCount = _selectedAnswers.where((ans) => ans != -1).length;
    int leftCount = _questions.length - attemptedCount;
    var currentQuestion = _questions[_currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(widget.chapterTitle, style: const TextStyle(fontSize: 16)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Text(
                _formatTime(_secondsRemaining),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: _secondsRemaining < 120
                      ? Colors.red
                      : Colors.teal[700],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // 📊 TOP METRICS BAR
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Attempted: $attemptedCount',
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Q: ${_currentQuestionIndex + 1}/${_questions.length}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Left: $leftCount',
                    style: const TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),

            // 📝 QUIZ ENGINE QUESTION LAYER
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentQuestion['question'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Render Options Buttons
                    ...List.generate(4, (index) {
                      bool isSelected =
                          _selectedAnswers[_currentQuestionIndex] == index;
                      return Container(
                        margin: const EdgeInsets.only(bottom: 14),
                        width: double.infinity,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 20,
                            ),
                            backgroundColor: isSelected
                                ? Colors.teal[50]
                                : Colors.white,
                            side: BorderSide(
                              color: isSelected
                                  ? Colors.teal
                                  : Colors.grey[300]!,
                              width: isSelected ? 2 : 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          onPressed: () {
                            setState(() {
                              _selectedAnswers[_currentQuestionIndex] = index;
                            });
                          },
                          child: Text(
                            currentQuestion['options'][index],
                            style: TextStyle(
                              fontSize: 15,
                              color: isSelected
                                  ? Colors.teal[900]
                                  : Colors.black87,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),

            // 📑 FOOTER NAVIGATION CONTROLS
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      foregroundColor: Colors.black87,
                    ),
                    onPressed: _currentQuestionIndex > 0
                        ? () => setState(() => _currentQuestionIndex--)
                        : null,
                    child: const Text('Previous'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _currentQuestionIndex == _questions.length - 1
                          ? Colors.green[700]
                          : Colors.teal[700],
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      if (_currentQuestionIndex < _questions.length - 1) {
                        setState(() => _currentQuestionIndex++);
                      } else {
                        _submitQuiz();
                      }
                    },
                    child: Text(
                      _currentQuestionIndex == _questions.length - 1
                          ? 'Submit'
                          : 'Next',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
