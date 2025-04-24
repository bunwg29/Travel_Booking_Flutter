import 'package:book_tour/core/util/UtilConst.dart';
import 'package:book_tour/data/domain/EndpointCustomer.dart';
import 'package:book_tour/model/RateModel.dart';
import 'package:book_tour/model/RequestCreateBooking.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repositoryuserdetailtour {
  final Dio dio;
  final SharedPreferences sharedPreferences;
  Repositoryuserdetailtour(
      {required this.dio, required this.sharedPreferences});

  Future<List<RateModel>> getAllRate(int idTour) async {
    Response response = await dio.get("${Endpointcustomer.getAllRate}/$idTour");
    if (response.statusCode == 200) {
      List<dynamic> datas = response.data;
      return datas
          .map(
            (e) => RateModel.fromMap(e),
          )
          .toList();
    }
    return [];
  }

  Future<void> bookTour(
      {required RequestCreateBooking data,
      required Function() success,
      required Function() error}) async {
    int idUser = await getIdUser();
    data.idUser = idUser;
    print(data.toJson());
    Response response =
        await dio.post(Endpointcustomer.bookTour, data: data.toJson());
    if (response.statusCode == 200) {
      success();
    } else {
      error();
    }
  }

  Future<int> getIdUser() async {
    return sharedPreferences.getInt(UtilConst.idUser)!;
  }
}
