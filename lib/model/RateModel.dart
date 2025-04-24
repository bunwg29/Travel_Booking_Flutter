import 'dart:convert';

import 'package:book_tour/model/CustomerModel.dart';

class RateModel {
  int? id;
  double? rateStar;
  String? comment;
  CustomerModel? customer;
  DateTime? createdAt;

  RateModel({
    this.id,
    this.rateStar,
    this.comment,
    this.customer,
    this.createdAt,
  });

  factory RateModel.fromMap(Map<String, dynamic> map) {
    return RateModel(
      id: map['id'] as int?,
      rateStar: map['rateStar']?.toDouble(),
      comment: map['comment'] as String?,
      customer: map['customer'] != null
          ? CustomerModel.fromMap(map['customer'])
          : null,
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'rateStar': rateStar,
      'comment': comment,
      'customer': customer?.toMap(),
      'createdAt': createdAt?.millisecondsSinceEpoch,
    };
  }

  String toJson() => json.encode(toMap());

  factory RateModel.fromJson(String source) =>
      RateModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RateModel(id: $id, rateStar: $rateStar, comment: $comment, customer: $customer, createdAt: $createdAt)';
  }
}
