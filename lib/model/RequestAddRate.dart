import 'dart:convert';

class Requestaddrate {
  int? idUser;
  int idTour;
  String? comment;
  double rateStar;

  Requestaddrate({
    this.comment,
    this.idUser,
    required this.idTour,
    required this.rateStar,
  });

  Map<String, dynamic> toMap() {
    return {
      'idUser': idUser,
      'idTour': idTour,
      if (comment != null) 'comment': comment,
      'rateStar': rateStar,
    };
  }

  factory Requestaddrate.fromMap(Map<String, dynamic> map) {
    return Requestaddrate(
      idUser: map['idUser'],
      idTour: map['idTour'],
      comment: map['comment'],
      rateStar: (map['rateStar'] as num).toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Requestaddrate.fromJson(String source) =>
      Requestaddrate.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Requestaddrate(idUser: $idUser, idTour: $idTour, comment: $comment, rateStar: $rateStar)';
  }
}
