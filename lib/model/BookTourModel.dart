
import 'dart:convert';

import 'package:book_tour/model/TourModel.dart';

class Booktourmodel {
  int? id;
  int? createdAt;
  int? updatedAt;
  String? createdBy;
  String? modifiedBy;
  String? status;
  int? countMember;
  int? dateStart;
  int? totalMoney;
  String? paymentMethod;
  TourModel? tour;

  Booktourmodel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.modifiedBy,
    this.status,
    this.countMember,
    this.dateStart,
    this.totalMoney,
    this.paymentMethod,
    this.tour,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'createdBy': createdBy,
      'modifiedBy': modifiedBy,
      'status': status,
      'countMember': countMember,
      'dateStart': dateStart,
      'totalMoney': totalMoney,
      'paymentMethod': paymentMethod,
      'tour': tour?.toMap(),
    };
  }

  factory Booktourmodel.fromMap(Map<String, dynamic> map) {
    return Booktourmodel(
      id: map['id'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      createdBy: map['createdBy'],
      modifiedBy: map['modifiedBy'],
      status: map['status'],
      countMember: map['countMember'],
      dateStart: map['dateStart'],
      totalMoney: map['totalMoney'],
      paymentMethod: map['paymentMethod'],
      tour: map['tour'] != null ? TourModel.fromMap(map['tour']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Booktourmodel.fromJson(String source) =>
      Booktourmodel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Booktourmodel(id: $id, createdAt: $createdAt, status: $status, tour: $tour)';
  }
}
