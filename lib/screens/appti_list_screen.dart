import 'package:crackit/screens/global_favorites.dart';
import 'package:flutter/material.dart';
import '../data/question_data.dart';
import '../models/question_model.dart';

class ApptiListScreen extends StatefulWidget {
  const ApptiListScreen({super.key});

  @override
  State<ApptiListScreen> createState() => _ApptiListScreenState();
}

class _ApptiListScreenState extends State<ApptiListScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late List<QuestionModell> aptitudeList;
  late List<QuestionModell> reasoningList;
  late List<QuestionModell> verbalList;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _updateQuestionLists();
  }

  void _updateQuestionLists() {
    aptitudeList = questionapp.where((q) => q.category == "Aptitude").toList();
    reasoningList = questionapp.where((q) => q.category == "Reasoning").toList();
    verbalList = questionapp.where((q) => q.category == "Verbal").toList();
  }

  void toggleFavorite(QuestionModell question) {
    setState(() {
      question.isFavorite = !question.isFavorite;

      final index = questionapp.indexWhere((q) => q.id == question.id);
      if (index != -1) {
        questionapp[index].isFavorite = question.isFavorite;
      }

      if (question.isFavorite) {
        if (!globalAptitudeFavorites.contains(question)) {
          globalAptitudeFavorites.add(question);
        }
      } else {
        globalAptitudeFavorites.removeWhere((q) => q.id == question.id);
      }
    });
  }

  void toggleExpand(QuestionModell question) {
    setState(() {
      question.isExpanded = !question.isExpanded;
    });
  }

  // Color palette for varied container colors
  Color getColorByIndex(int index) {
    const colors = [
      Color(0xFFD7F2EF), // Mint
      Color(0xFFDDE6FB), // Blue
      Color(0xFFFFF0D5), // Peach
      Color(0xFFEADAEF), // Lavender
      Color(0xFFFFE2E2), // Pink
      Color(0xFFE1F5C4), // Light green
      Color(0xFFFFEFD6), // Yellow
    ];
    return colors[index % colors.length];
  }

  Widget buildQuestionList(List<QuestionModell> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final q = list[index];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: getColorByIndex(index),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                q.question,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
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
                    onPressed: () => toggleFavorite(q),
                  ),
                  IconButton(
                    icon: Icon(
                      q.isExpanded ? Icons.expand_less : Icons.expand_more,
                      color: Colors.black,
                    ),
                    onPressed: () => toggleExpand(q),
                  ),
                ],
              ),
              if (q.isExpanded)
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: Colors.white.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "💡 Example:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(q.example),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questions by Category'),
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Aptitude",),
            Tab(text: "Reasoning"),
            Tab(text: "Verbal"),
          ],
        ),
        backgroundColor: const Color(0xFFA695B7),
        
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildQuestionList(aptitudeList),
          buildQuestionList(reasoningList),
          buildQuestionList(verbalList),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
