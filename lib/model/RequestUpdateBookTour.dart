import 'dart:convert';

class Requestupdatebooktour {
  int? id;
  int? countMember;
  DateTime? dateStart;
  int? totalMoney;

  Requestupdatebooktour({this.id, this.countMember, this.dateStart, this.totalMoney});

  // Chuyển đối tượng thành Map
  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      if (countMember != null) 'countMember': countMember,
      if (dateStart != null) 'dateStart': dateStart?.toIso8601String(), // Chuyển DateTime thành String
      if (totalMoney != null) 'totalMoney': totalMoney,
    };
  }

  // Tạo đối tượng từ Map
  factory Requestupdatebooktour.fromMap(Map<String, dynamic> map) {
    return Requestupdatebooktour(
      id: map['id'] as int?,
      countMember: map['countMember'] as int?,
      dateStart: map['dateStart'] != null ? DateTime.parse(map['dateStart']) : null,
      totalMoney: map['totalMoney'] as int?,
    );
  }

  // Chuyển đối tượng thành JSON
  String toJson() => json.encode(toMap());

  // Tạo đối tượng từ JSON
  factory Requestupdatebooktour.fromJson(String source) =>
      Requestupdatebooktour.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BookTourUpdateRequest(id: $id, countMember: $countMember, dateStart: $dateStart, totalMoney: $totalMoney)';
  }
}
