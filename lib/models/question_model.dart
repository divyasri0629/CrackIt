
class QuestionModel {
  final String question;
  final String pseudocode;
  final String gfgLink;
  final String lcLink;
  bool isFavorite;
  bool isExpanded;

  QuestionModel({
    required this.question,
    required this.pseudocode,
    required this.gfgLink,
    required this.lcLink,
    this.isFavorite = false,
    this.isExpanded = false,
  });
}class QuestionModell {
  final String id;
  final String question;       
  final String example;        
  final String category;      
  final String difficulty;    
  bool isFavorite;            
  bool isExpanded;           

  QuestionModell({
    required this.question,
    required this.example,
    required this.id,
    this.category = 'General',
    this.difficulty = 'Easy',
    this.isFavorite = false,
    this.isExpanded = false,
  });
}

class MCQ {
  final String question;
  final List<String> options;
  final String answer;
  bool isFavorite;
  bool isExpanded;

  MCQ({
    required this.question,
    required this.options,
    required this.answer,
    this.isFavorite = false,
    this.isExpanded = false,
  });

  static void removeWhere(bool Function(dynamic item) param0) {}

  static void add(MCQ techMcq) {}
}
class HrQuestionModel {
  final String question;
  final String answer;
  bool isFavorite;
  bool isExpanded;

  HrQuestionModel({
    required this.question,
    required this.answer,
    this.isFavorite = false,
    this.isExpanded = false,
  });
}class TopicModel {
  final String title;         
  final List<String> topics; 
bool isFavorite;
  bool isExpanded;
  TopicModel({
    required this.title,
    required this.topics,
    this.isFavorite = false,
    this.isExpanded = false,
  });
}

class ManagerialQuestionModel {
  final String question;
  final String answer;
  bool isExpanded;
  bool isFavorite;

  ManagerialQuestionModel({
    required this.question,
    required this.answer,
    this.isExpanded = false,
    this.isFavorite = false,
  });
}


class Mcq {
  final String question;
  final List<String> options;
  final String answer;

  Mcq({
    required this.question,
    required this.options,
    required this.answer,
  });
}


