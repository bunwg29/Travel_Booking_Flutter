import 'package:book_tour/core/util/UtilConst.dart';
import 'package:book_tour/data/domain/EndpointCustomer.dart';
import 'package:book_tour/model/BookTourModel.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repositoryuserbooked {
  final Dio dio;
  final SharedPreferences sharedPreferences;
  Repositoryuserbooked({required this.dio, required this.sharedPreferences});

  Future<List<Booktourmodel>> getAllBooked() async {
    int idUser = await getIdUser();
    Response response =
        await dio.get("${Endpointcustomer.getAllBookTourByIdUser}/$idUser");
    if (response.statusCode == 200) {
      List<dynamic> datas = response.data;
      return datas
          .map(
            (e) => Booktourmodel.fromMap(e),
          )
          .toList();
    }
    return [];
  }

  Future<int> getIdUser() async {
    return sharedPreferences.getInt(UtilConst.idUser)!;
  }
}
