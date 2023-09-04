class QuizModel {
  var id;
  var score;
  var done;
  var name;
  var free;
  var category;
  var level;

  QuizModel({id, score, name, free, category, level, done});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'score': score,
      'done': done,
      'free': free,
      'level': level,
      'category': category
    };
  }


  QuizModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name= json['name'];
    score= json['score'];
    done= json['done'];
    free= json['free'];
    level= json['level_id'];
    category= json['category_id'];
  }
}
