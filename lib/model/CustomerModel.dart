import 'dart:convert';

import 'package:book_tour/model/UserModel.dart';

class CustomerModel {
  UserModel? user;
  String? username;
  String? phone;
  String? img;

  CustomerModel({this.user, this.username, this.phone, this.img});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      if (user != null) 'user': user!.toMap(),
      if (username != null) 'username': username,
      if (phone != null) 'phone': phone,
      if (img != null) 'img': img,
    };
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      user: map['user'] != null ? UserModel.fromMap(map['user']) : null,
      username: map['username'] != null ? map['username'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      img: map['img'] != null ? map['img'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromJson(String source) =>
      CustomerModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CustomerModel(user: $user, username: $username, phone: $phone img: $img) ';
}
