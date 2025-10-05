import 'dart:math';
import 'package:crackit/models/mcq_question.dart';
import 'package:flutter/material.dart';

class MockTestScreen extends StatefulWidget {
  const MockTestScreen({super.key});

  @override
  State<MockTestScreen> createState() => _MockTestScreenState();
}

class _MockTestScreenState extends State<MockTestScreen> {
  List<McqQuestion> selectedQuestions = [];
  int currentQuestionIndex = 0;
  int score = 0;
  bool showResult = false;
  bool quizStarted = false;
  String? selectedAnswer;
  String? selectedDomain;
  bool isAnswerChecked = false;

  final Map<String, Color> domainColors = {
    "Aptitude": Colors.blue,
    "Coding": Colors.orange,
    "Technical": Colors.red,
    "OS": Colors.indigo,
    "SQL": Colors.brown,
    "Networking": Colors.cyan,
  };

  void startTest() {
    setState(() {
      final random = Random();
      List<McqQuestion> domainQuestions = selectedDomain == "All Domains"
          ? List.from(mcqList)
          : mcqList.where((q) => q.domain == selectedDomain).toList();
          
      selectedQuestions = (List<McqQuestion>.from(domainQuestions))..shuffle(random);
      selectedQuestions = selectedQuestions.take(10).toList();
      currentQuestionIndex = 0;
      score = 0;
      showResult = false;
      quizStarted = true;
      selectedAnswer = null;
      isAnswerChecked = false;
    });
  }

  void checkAnswer(String option) {
    setState(() {
      selectedAnswer = option;
      isAnswerChecked = true;
      
      if (option == selectedQuestions[currentQuestionIndex].answer) {
        score++;
      }
      
      Future.delayed(const Duration(milliseconds: 800), () {
        moveToNextQuestion();
      });
    });
  }

  void moveToNextQuestion() {
    setState(() {
      if (currentQuestionIndex < selectedQuestions.length - 1) {
        currentQuestionIndex++;
        selectedAnswer = null;
        isAnswerChecked = false;
      } else {
        showResult = true;
      }
    });
  }

  Color _getOptionColor(String option, String correctAnswer) {
    if (!isAnswerChecked) return Colors.transparent;
    if (option == correctAnswer) return Colors.green.withOpacity(0.2);
    if (selectedAnswer == option && option != correctAnswer) return Colors.red.withOpacity(0.2);
    return Colors.transparent;
  }

  Color _getOptionBorderColor(String option) {
    if (!isAnswerChecked) return Colors.grey;
    if (option == selectedQuestions[currentQuestionIndex].answer) return Colors.green;
    if (option == selectedAnswer) return Colors.red;
    return Colors.grey;
  }

  Color _getOptionTextColor(String option, String correctAnswer) {
    if (!isAnswerChecked) return Colors.black;
    if (option == correctAnswer) return Colors.green[800]!;
    if (option == selectedAnswer && option != correctAnswer) return Colors.red[800]!;
    return Colors.black;
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
    final domains = ["All Domains", ...domainColors.keys];
    
    return Scaffold(
      backgroundColor:Color(0xFFEADADE) ,
      appBar: AppBar(
        title: const Text('Mock Test'),
        foregroundColor: Colors.white,
        backgroundColor:   Color(0xFFC8BAD3) ,// Light pinkish lavender

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select a domain for your test:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedDomain ?? "All Domains",
              items: domains.map((domain) {
                return DropdownMenuItem(
                  value: domain,
                  child: Text(domain),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedDomain = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Test Domain',
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                backgroundColor: Colors.deepPurple,
              ),
              onPressed: startTest,
              child: const Text(
                "Start Test",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultScreen() {
    final percentage = (score / selectedQuestions.length * 100).round();
    final color = percentage >= 70 
        ? Colors.green 
        : percentage >= 40 
          ? Colors.orange 
          : Colors.red;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Result'),
        backgroundColor: domainColors[selectedQuestions.first.domain] ?? Colors.deepPurple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Domain: ${selectedDomain ?? "Mixed"}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  shape: BoxShape.circle,
                  border: Border.all(color: color, width: 3),
                ),
                child: Center(
                  child: Text(
                    '$percentage%',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Score: $score / ${selectedQuestions.length}',
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  backgroundColor: domainColors[selectedQuestions.first.domain] ?? Colors.deepPurple,
                ),
                onPressed: startTest,
                child: const Text(
                  "Retake Test",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionScreen() {
    final question = selectedQuestions[currentQuestionIndex];
    final progress = (currentQuestionIndex + 1) / selectedQuestions.length;
    final domainColor = domainColors[question.domain] ?? Colors.deepPurple;

    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${currentQuestionIndex + 1}/${selectedQuestions.length}'),
        backgroundColor: domainColor,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: domainColor.withOpacity(0.3),
            valueColor: AlwaysStoppedAnimation<Color>(domainColor),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Domain Chip
              Chip(
                label: Text(
                  question.domain,
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: domainColor,
              ),
              const SizedBox(height: 20),
              
              // Question Text
              Text(
                question.question,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              
              // Options with A/B/C/D labels
              Column(
                children: [
                  for (int i = 0; i < question.options.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: GestureDetector(
                        onTap: !isAnswerChecked 
                            ? () => checkAnswer(question.options[i]) 
                            : null,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          decoration: BoxDecoration(
                            color: _getOptionColor(question.options[i], question.answer),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: _getOptionBorderColor(question.options[i]),
                              width: 2,
                            ),
                          ),
                          child: Row(
                            children: [
                              // Option letter (A/B/C/D)
                              Container(
                                width: 30,
                                height: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: domainColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  String.fromCharCode(65 + i), // A, B, C, D
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              
                              // Option text
                              Expanded(
                                child: Text(
                                  question.options[i],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: _getOptionTextColor(question.options[i], question.answer),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              
            ]
        ),
      ),
      )
    );
  }
}