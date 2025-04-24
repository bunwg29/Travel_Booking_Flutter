import 'package:book_tour/core/util/UtilConst.dart';
import 'package:book_tour/data/domain/EndpointCustomer.dart';
import 'package:book_tour/model/BookTourModel.dart';
import 'package:book_tour/model/RequestAddRate.dart';
import 'package:book_tour/model/RequestUpdateBookTour.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repositoryuserdetailbooked {
  final Dio dio;
  final SharedPreferences sharedPreferences;
  Repositoryuserdetailbooked(
      {required this.dio, required this.sharedPreferences});

  Future<void> updateTour(
      {required Requestupdatebooktour data,
      required Function(Booktourmodel booked) success,
      required Function() error}) async {
    Response response =
        await dio.put(Endpointcustomer.updateBooked, data: data.toJson());
    if (response.statusCode == 200) {
      Booktourmodel booktourmodel = Booktourmodel.fromMap(response.data);
      success(booktourmodel);
    } else {
      error();
    }
  }

  Future<void> updateStatus(
      {required String status,
      required int id,
      required Function(Booktourmodel booked) success,
      required Function() error}) async {
    Response response =
        await dio.put("${Endpointcustomer.updateStatus}/$id", data: status);
    if (response.statusCode == 200) {
      Booktourmodel booktourmodel = Booktourmodel.fromMap(response.data);
      success(booktourmodel);
    } else {
      error();
    }
  }

  Future<void> addRate(
      {required Function() success,
      required Requestaddrate data,
      required Function() e}) async {
    int idUser = sharedPreferences.getInt(UtilConst.idUser)!;
    data.idUser = idUser;
    Response response =
        await dio.post(Endpointcustomer.addaRate, data: data.toJson());
    if (response.statusCode == 200) {
      success();
    } else {
      e();
    }
  }
}
