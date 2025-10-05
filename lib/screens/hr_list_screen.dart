import 'package:crackit/screens/global_favorites.dart';
import 'package:flutter/material.dart';
import '../data/question_data.dart'; 

class HrListScreen extends StatefulWidget {
  const HrListScreen({super.key});

  @override
  State<HrListScreen> createState() => _HrListScreenState();
}

class _HrListScreenState extends State<HrListScreen> {
  final List<Color> cardColors = [
    Color.fromARGB(255, 240, 255, 240), // mint cream
  Color.fromARGB(255, 255, 253, 235), // light lemon
  Color.fromARGB(255, 255, 248, 240), // soft peach
  Color.fromARGB(255, 245, 245, 255), // lavender hint
  Color.fromARGB(255, 255, 240, 245), // blush rose
  Color.fromARGB(255, 245, 255, 250), // honeydew
  Color.fromARGB(255, 253, 253, 243), // ivory tone
  Color.fromARGB(255, 243, 255, 255),
  ];

  void toggleExpand(int index) {
    setState(() {
      hrQuestions[index].isExpanded = !hrQuestions[index].isExpanded;
    });
  }

  void toggleFavorite(int index) {
    setState(() {
      hrQuestions[index].isFavorite = !hrQuestions[index].isFavorite;
      if (hrQuestions[index].isFavorite) {
        if (!globalHrFavorites.contains(hrQuestions[index])) {
          globalHrFavorites.add(hrQuestions[index]);
        }
      } else {
        globalHrFavorites.removeWhere((q) => q.question == hrQuestions[index].question);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HR Interview Questions'),
        centerTitle: true,
        backgroundColor: Color(0xFFA695B7),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: hrQuestions.length,
        itemBuilder: (context, index) {
          final q = hrQuestions[index];
          final cardColor = cardColors[index % cardColors.length];

          return Card(
            color: cardColor,
            margin: const EdgeInsets.all(8),
            child: ExpansionTile(
              key: PageStorageKey(index),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(q.question)),
                  IconButton(
                    icon: Icon(
                      q.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: q.isFavorite ? Colors.red : const Color.fromARGB(255, 0, 0, 0),
                    ),
                    onPressed: () => toggleFavorite(index),
                  ),
                ],
              ),
              initiallyExpanded: q.isExpanded,
              onExpansionChanged: (_) => toggleExpand(index),
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  color: Colors.green.shade50,
                  child: Text(
                    q.answer,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
