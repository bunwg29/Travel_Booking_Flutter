import 'dart:convert';

class RequestCreateBooking {
  int? idUser;
  int? idTour;
  int? countMember;
  DateTime? dateStart;
  int? totalMoney;
  String? paymentMethod;

  RequestCreateBooking({
    this.idUser,
    this.idTour,
    this.countMember,
    this.dateStart,
    this.totalMoney,
    this.paymentMethod,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      if (idUser != null) 'idUser': idUser,
      if (idTour != null) 'idTour': idTour,
      if (countMember != null) 'countMember': countMember,
      if (dateStart != null) 'dateStart': dateStart!.toIso8601String(),
      if (totalMoney != null) 'totalMoney': totalMoney,
      if (paymentMethod != null) 'paymentMethod': paymentMethod,
    };
  }

  factory RequestCreateBooking.fromMap(Map<String, dynamic> map) {
    return RequestCreateBooking(
      idUser: map['idUser'] != null ? map['idUser'] as int : null,
      idTour: map['idTour'] != null ? map['idTour'] as int : null,
      countMember:
          map['countMember'] != null ? map['countMember'] as int : null,
      dateStart:
          map['dateStart'] != null ? DateTime.parse(map['dateStart']) : null,
      totalMoney: map['totalMoney'] != null ? map['totalMoney'] as int : null,
      paymentMethod:
          map['paymentMethod'] != null ? map['paymentMethod'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestCreateBooking.fromJson(String source) =>
      RequestCreateBooking.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RequestCreateBooking(idUser: $idUser, idTour: $idTour, countMember: $countMember, dateStart: $dateStart, totalMoney: $totalMoney, paymentMethod: $paymentMethod)';
  }
}
