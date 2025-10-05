import 'dart:math';
import 'package:crackit/models/mcq_question.dart';
import 'package:flutter/material.dart';

class MockTestScreen extends StatefulWidget {
  const MockTestScreen({Key? key}) : super(key: key);

  @override
  State<MockTestScreen> createState() => _MockTestScreenState();
}

class _MockTestScreenState extends State<MockTestScreen> {
  late List<McqQuestion> selectedQuestions;
  int currentQuestionIndex = 0;
  int score = 0;
  bool showResult = false;
  bool quizStarted = false;
  String? selectedAnswer;

  void startTest() {
    setState(() {
      final random = Random();
      selectedQuestions = (List<McqQuestion>.from(mcqList)..shuffle(random));
      selectedQuestions = selectedQuestions.take(7).toList();
      currentQuestionIndex = 0;
      score = 0;
      showResult = false;
      quizStarted = true;
      selectedAnswer = null;
    });
  }

  void checkAnswer(String option) {
    setState(() {
      selectedAnswer = option;
      if (option == selectedQuestions[currentQuestionIndex].answer) {
        score++;
      }
      
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          if (currentQuestionIndex < selectedQuestions.length - 1) {
            currentQuestionIndex++;
            selectedAnswer = null;
          } else {
            showResult = true;
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!quizStarted) {
      return _buildStartScreen();
    }

    if (showResult) {
      return _buildResultScreen();
    }

    return _buildQuestionScreen();
  }

  Widget _buildStartScreen() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mock Test'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Test contains 7 random questions',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              onPressed: startTest,
              child: const Text(
                "Start Test",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultScreen() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Result'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Score: $score/${selectedQuestions.length}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '${(score / selectedQuestions.length * 100).toStringAsFixed(1)}%',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              onPressed: startTest,
              child: const Text("Retake Test"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionScreen() {
    final question = selectedQuestions[currentQuestionIndex];
    final progress = (currentQuestionIndex + 1) / selectedQuestions.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${currentQuestionIndex + 1}/${selectedQuestions.length}'),
        backgroundColor: Colors.deepPurple,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.deepPurple[100],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple[400]!),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question.question,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ...question.options.map((option) {
              final isSelected = selectedAnswer == option;
              final isCorrect = option == question.answer;
              
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected
                        ? (isCorrect ? Colors.green : Colors.red)
                        : null,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: selectedAnswer == null 
                      ? () => checkAnswer(option) 
                      : null,
                  child: Text(
                    option,
                    style: TextStyle(
                      color: isSelected ? Colors.white : null,
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}