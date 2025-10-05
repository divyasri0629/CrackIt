import 'package:crackit/screens/global_favorites.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/question_data.dart';

class QuestionListScreen extends StatefulWidget {
  const QuestionListScreen({super.key});

  @override
  State<QuestionListScreen> createState() => _QuestionListScreenState();
}

class _QuestionListScreenState extends State<QuestionListScreen> {
  final List<Color> cardColors = [
    Color(0xFFE0F7FA),
    Color(0xFFF1F8E9),
    Color(0xFFFFF3E0),
    Color(0xFFFFEBEE),
    Color(0xFFEDE7F6),
    Color(0xFFF3E5F5),
    Color(0xFFE8F5E9),
    Color(0xFFFFFDE7),
    Color(0xFFE3F2FD),
    Color(0xFFFBE9E7),
  ];

  void toggleFavorite(int index) {
    setState(() {
      questions[index].isFavorite = !questions[index].isFavorite;

      if (questions[index].isFavorite) {
        if (!globalDsaFavorites.contains(questions[index])) {
          globalDsaFavorites.add(questions[index]);
        }
      } else {
        globalDsaFavorites.removeWhere((q) => q.question == questions[index].question);
      }
    });
  }

  void toggleExpand(int index) {
    setState(() {
      questions[index].isExpanded = !questions[index].isExpanded;
    });
  }

void openLink(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  } else {
    throw 'Could not launch $url';
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coding Questions'),
        backgroundColor: Color(0xFFA695B7),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final q = questions[index];
          final color = cardColors[index % cardColors.length];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  q.question,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(
                        q.isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: q.isFavorite ? Colors.red : Colors.black,
                      ),
                      onPressed: () => toggleFavorite(index),
                    ),
                    IconButton(
                      icon: Icon(
                        q.isExpanded ? Icons.expand_less : Icons.expand_more,
                        color: Colors.black,
                      ),
                      onPressed: () => toggleExpand(index),
                    ),
                  ],
                ),
                if (q.isExpanded)
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "📜 Pseudocode:",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          q.pseudocode,
                          style: const TextStyle(fontFamily: 'monospace'),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () => openLink(q.gfgLink),
                              child: const Text("🔗 GFG"),
                            ),
                            TextButton(
                              onPressed: () => openLink(q.lcLink),
                              child: const Text("🔗 LeetCode"),
                            ),
                          ],
                        ),
                      ],
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
