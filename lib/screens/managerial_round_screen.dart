
import 'package:crackit/screens/global_favorites.dart';
import 'package:flutter/material.dart';
import '../models/question_model.dart';
import '../data/question_data.dart';

class ManagerialListScreen extends StatefulWidget {
  const ManagerialListScreen({super.key});

  @override
  State<ManagerialListScreen> createState() => _ManagerialListScreenState();
}

class _ManagerialListScreenState extends State<ManagerialListScreen> {
  final List<Color> cardColors = [
    Color(0xFFFFF3E0), // Light Orange
    Color(0xFFE3F2FD), // Light Blue
    Color(0xFFF1F8E9), // Light Green
    Color(0xFFFCE4EC), // Light Pink
    Color(0xFFE8EAF6), // Light Indigo
    Color(0xFFFFEBEE), // Light Red
    Color(0xFFF3E5F5), // Light Purple
    Color(0xFFE0F7FA), // Light Cyan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Managerial Questions'),
        backgroundColor: Color(0xFFA695B7),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: managerialQuestions.length,
        itemBuilder: (context, index) {
          ManagerialQuestionModel question = managerialQuestions[index];
          Color cardColor = cardColors[index % cardColors.length];

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            color: cardColor,
            child: ExpansionTile(
              title: Text(
                question.question,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                icon: Icon(
                  question.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: question.isFavorite ? Colors.red : null,
                ),
                onPressed: () {
                  setState(() {
                    question.isFavorite = !question.isFavorite;
                    if (question.isFavorite) {
                      bool exists = globalManagerialFavorites.any((q) => q.question == question.question);
                      if (!exists) {
                        globalManagerialFavorites.add(question);
                      }
                    } else {
                      globalManagerialFavorites.removeWhere((q) => q.question == question.question);
                    }
                  });
                },
              ),
              onExpansionChanged: (value) {
                setState(() {
                  question.isExpanded = value;
                });
              },
              children: [
                Padding(
                  padding: const EdgeInsets.all(19.0),
                  child: Text(question.answer),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
