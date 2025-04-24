import 'package:book_tour/data/domain/EndpointCustomer.dart';
import 'package:book_tour/model/TourModel.dart';
import 'package:dio/dio.dart';

class Repositoryhome {
  final Dio dio;

  Repositoryhome({required this.dio});

  Future<List<TourModel>> getAllTour() async {
    Response response = await dio.get(Endpointcustomer.getAllTour);
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data
          .map(
            (e) => TourModel.fromMap(e),
          )
          .toList();
    }
    return [];
  }
}
