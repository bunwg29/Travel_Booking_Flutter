import 'package:book_tour/data/domain/EndpointAdmin.dart';
import 'package:book_tour/model/TourModel.dart';
import 'package:dio/dio.dart';

class Repositoryadmindetailtour {
  final Dio dio;
  Repositoryadmindetailtour({required this.dio});

  Future<void> fixTour({
    required TourModel data,
    required Function(TourModel tour) success,
    required Function() erorr,
  }) async {
    Response response =
        await dio.put(EndpointAdmin.fixTour, data: data.toJson());
    if (response.statusCode == 200) {
      final tour = TourModel.fromMap(response.data);
      success(tour);
    } else {
      erorr();
    }
  }

  Future<void> deleteToru({
    required int idTour,
    required Function() success,
    required Function() erorr,
  }) async {
    Response response = await dio.delete("${EndpointAdmin.fixTour}/$idTour");
    if (response.statusCode == 200) {
      success();
    } else {
      erorr();
    }
  }
}
