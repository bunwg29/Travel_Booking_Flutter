import 'dart:convert';

import 'package:book_tour/model/ActivityScheduleModel.dart';
import 'package:book_tour/model/AddressModel.dart';

class TourModel {
  int? id;
  String? name;
  String? description;
  int? price;
  String? type;
  AddressModel? address;
  List<String>? imgs;
  List<ActivityScheduleModel>? activitySchedules;
  double? averageRate;

  TourModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.type,
    this.address,
    this.imgs,
    this.activitySchedules,
    this.averageRate,
  });

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (price != null) 'price': price,
      if (type != null) 'type': type,
      if (address != null) 'address': address!.toMap(),
      if (imgs != null) 'imgs': imgs,
      if (activitySchedules != null)
        'activitySchedules': activitySchedules!.map((e) => e.toMap()).toList(),
      if (averageRate != null) 'averageRate': averageRate,
    };
  }

  factory TourModel.fromMap(Map<String, dynamic> map) {
    return TourModel(
      id: map['id'] as int?,
      name: map['name'] as String?,
      description: map['description'] as String?,
      price: map['price'] as int?,
      type: map['type'] as String?,
      address:
          map['address'] != null ? AddressModel.fromMap(map['address']) : null,
      imgs: map['imgs'] != null ? List<String>.from(map['imgs']) : null,
      activitySchedules: map['activitySchedules'] != null
          ? (map['activitySchedules'] as List)
              .map((e) => ActivityScheduleModel.fromMap(e))
              .toList()
          : null,
      averageRate: map['averageRate'] != null
          ? (map['averageRate'] as num).toDouble()
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TourModel.fromJson(String source) =>
      TourModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TourModel(id: $id, name: $name, price: $price, averageRate: $averageRate )';
  }
}
