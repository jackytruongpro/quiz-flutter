class Question {
  String intitule;
  int bonneReponse;
  List<Reponse> reponses;

  Question({
    required this.intitule,
    required this.bonneReponse,
    required this.reponses,
  });

  Map<String, dynamic> toJson() {
    return {
      'intitule': intitule,
      'bonneReponse': bonneReponse,
    };
  }

  factory Question.fromJson(Map<String, dynamic> json) {
    List<Reponse> reponses = (json['reponses'] as List)
        .map((reponseJson) => Reponse.fromJson(reponseJson))
        .toList();

    return Question(
      intitule: json['intitule'] as String,
      bonneReponse: json['bonneReponse'] as int,
      reponses: reponses,
    );
  }
}

class Reponse {
  int id;
  String intitule;

  Reponse({
    required this.id,
    required this.intitule,
  });

  factory Reponse.fromJson(Map<String, dynamic> json) {
    return Reponse(
      id: json['id'] as int,
      intitule: json['intitule'] as String,
    );
  }
}
