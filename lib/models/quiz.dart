class QuizModel {
  var id;
  var score;
  var name;
  var free;
  var category;
  var level;
  var done;
  var nb_questions;

  QuizModel({id, score, name, free, category, level, done, nb_questions});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'done': done,
      'score': score,
      'free': free,
      'level': level,
      'category': category,
      'nb_questions': nb_questions
    };
  }

  QuizModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    score = json['score'];
    done = json['done'];
    free = json['free'];
    level = json['level_id'];
    category = json['category_id'];
    nb_questions = json['questions'];
  }
}
