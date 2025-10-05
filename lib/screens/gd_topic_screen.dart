import 'package:flutter/material.dart';
// import '../models/question_model.dart';
import '../data/question_data.dart'; // Your topicList is here

class GdTopicScreen extends StatefulWidget {
  const GdTopicScreen({super.key});

  @override
  State<GdTopicScreen> createState() => _GdTopicScreenState();
}

class _GdTopicScreenState extends State<GdTopicScreen> {
  final List<Color> cardColors = [
    Color(0xFFFFF3E0),
    Color(0xFFE8F5E9),
    Color(0xFFE3F2FD),
    Color(0xFFF3E5F5),
    Color(0xFFFFEBEE),
    Color(0xFFF1F8E9),
    Color(0xFFE0F2F1),
    Color(0xFFFFFDE7),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GD Topics'),
        centerTitle: true,
        backgroundColor: Color(0xFFA695B7),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: topicList.length,
        itemBuilder: (context, index) {
          final category = topicList[index];
          final color = cardColors[index % cardColors.length];

          return Card(
            color: color,
            elevation: 2,
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ExpansionTile(
              title: Text(
                category.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              children: category.topics.map((topic) {
                return ListTile(
                  title: Text(topic),
                  leading: const Icon(Icons.circle, size: 10, color: Color.fromARGB(255, 210, 145, 219)),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
