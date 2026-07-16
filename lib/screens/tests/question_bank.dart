class QuestionBank {
  // Generates 100 unique placeholder questions for a specific chapter
  static List<Map<String, dynamic>> get100Questions(String chapterName) {
    return List.generate(100, (index) {
      int qNum = index + 1;
      return {
        'id': qNum,
        'question':
            '[$chapterName] Core Question $qNum: Which of the following facts is true regarding this Jharkhand GK topic?',
        'options': [
          'Correct Option Fact for Q$qNum',
          'Incorrect Option Alpha',
          'Incorrect Option Beta',
          'Incorrect Option Gamma',
        ],
        'correctIndex': 0, // Keeping first option correct for simplicity
      };
    });
  }

  // Smart Repetition Engine: Picks 20 questions out of the 100
  // ensuring each question appears exactly 4 times across 20 tests.
  static List<Map<String, dynamic>> getQuestionsForTest(
    String chapterName,
    int testNumber,
  ) {
    List<Map<String, dynamic>> allQuestions = get100Questions(chapterName);
    List<Map<String, dynamic>> testQuestions = [];

    // Mathematical formula to distribute 100 questions into 20 slots across 20 tests
    // Test 1 gets Q1-20, Test 2 gets Q6-25, etc., rotating smoothly.
    int startIndex = ((testNumber - 1) * 5) % 100;

    for (int i = 0; i < 20; i++) {
      int targetIndex = (startIndex + i) % 100;
      testQuestions.add(allQuestions[targetIndex]);
    }

    // Shuffling the array elements so they don't appear in the exact same sequence order
    testQuestions.shuffle();
    return testQuestions;
  }
}
