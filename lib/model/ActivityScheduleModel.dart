import 'dart:convert';

class ActivityScheduleModel {
  int? id;
  String? title;
  String? description;

  ActivityScheduleModel({
    this.id,
    this.title,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
    };
  }

  factory ActivityScheduleModel.fromMap(Map<String, dynamic> map) {
    return ActivityScheduleModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ActivityScheduleModel.fromJson(String source) =>
      ActivityScheduleModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ActivityScheduleModel(id: $id, title: $title, description: $description)';
}
