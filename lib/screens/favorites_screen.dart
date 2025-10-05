
import 'package:flutter/material.dart';

import '../models/question_model.dart'; 


class FavoritesScreen extends StatefulWidget {
  final List<dynamic> favorites;

  const FavoritesScreen({super.key, required this.favorites});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late List<dynamic> favoriteItems;

  @override
  void initState() {
    super.initState();
    favoriteItems = widget.favorites;
  }

  void removeFromFavorites(dynamic item) {
    setState(() {
      favoriteItems.remove(item);

      if (item is QuestionModel ||
          item is QuestionModell ||
          item is MCQ ||
          item is HrQuestionModel ||
          item is ManagerialQuestionModel) {
        item.isFavorite = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        backgroundColor: Color(0xFFA695B7) ,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: favoriteItems.isEmpty
          ? const Center(child: Text("No favorites added yet."))
          : ListView.builder(
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                final item = favoriteItems[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(getTitle(item)),
                    subtitle: Text(getSubtitle(item)),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => removeFromFavorites(item),
                    ),
                  ),
                );
              },
            ),
    );
  }

  String getTitle(dynamic item) {
    try {
      if (item is QuestionModel ||
          item is QuestionModell ||
          item is MCQ ||
          item is HrQuestionModel ||
          item is ManagerialQuestionModel) {
        return item.question;
      } else if (item is String) {
        return item; 
      }
    } catch (_) {}
    return "Unknown";
  }

  String getSubtitle(dynamic item) {
    try {
      if (item is QuestionModel) {
        return "DSA:\n${item.pseudocode}";
      } else if (item is QuestionModell) {
        return "Aptitude:\n${item.example}";
      } else if (item is MCQ) {
        return "MCQ Answer:\n${item.answer}";
      } else if (item is HrQuestionModel) {
        return "HR Answer:\n${item.answer}";
      } else if (item is ManagerialQuestionModel) {
        return "Managerial Answer:\n${item.answer}";
      } else if (item is String) {
        return "GD Topic";
      }
    } catch (_) {}
    return "";
  }
}