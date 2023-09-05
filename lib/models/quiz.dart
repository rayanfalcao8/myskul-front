class QuizModel {
  var id;
  var score;
  var name;
  var free;
  var category;
  var level;
  var questions;

  QuizModel({id, score, name, free, category, level, questions});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'score': score,
      'free': free,
      'level': level,
      'category': category,
      'questions': questions
    };
  }

  QuizModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    score = json['score'];
    questions = json['questions'].toString();
    free = json['free'];
    level = json['level_id'];
    category = json['category_id'];
  }
}

class QuizList {
  final List<QuizModel> quizzes;
  QuizList({required this.quizzes});

  factory QuizList.fromJson(List<dynamic> parsedJson) {
    List<QuizModel> quizzes = <QuizModel>[];
    quizzes = parsedJson.map((i) => QuizModel.fromJson(i)).toList();
    return new QuizList(
      quizzes: quizzes,
    );
  }
}
