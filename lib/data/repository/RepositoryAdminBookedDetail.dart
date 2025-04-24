import 'package:book_tour/data/domain/EndpointAdmin.dart';
import 'package:book_tour/model/BookTourModel.dart';
import 'package:dio/dio.dart';

class Repositoryadminbookeddetail {
  final Dio dio;
  Repositoryadminbookeddetail({required this.dio});

  Future<void> confirm(
      {required String status,
      required int id,
      required Function(Booktourmodel booked) sucess,
      required Function() error}) async {
    Response response =
        await dio.put("${EndpointAdmin.confirm}/$id", data: status);
    if (response.statusCode == 200) {
      Booktourmodel booktourmodel = Booktourmodel.fromMap(response.data);
      sucess(booktourmodel);
    } else {
      error();
    }
  }
}
