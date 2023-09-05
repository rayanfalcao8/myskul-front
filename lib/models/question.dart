class QuestionModel {
  var id;
  var points;
  var name;
  var justification;
  var next_id;
  var answers;

  QuestionModel({id, points, name, justification, next_id, answers});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'points': points,
      'justification': justification,
      'next_id': next_id,
      'answers': answers,
    };
  }

  QuestionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    points = json['points'];
    justification = json['justification'];
    next_id = json['next_id'];
    answers = (json['answers'] as List).map((e) => AnswerModel.fromJson(e)).toList();
  }
}

class AnswerModel {
  var id;
  var name;
  var isCorrect;

  AnswerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isCorrect = json['isCorrect'];
  }
}