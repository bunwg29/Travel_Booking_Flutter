import 'package:book_tour/data/domain/EndpointCustomer.dart';
import 'package:book_tour/model/TourModel.dart';
import 'package:dio/dio.dart';

class Repositorysearch {
  final Dio dio;
  Repositorysearch({required this.dio});

  Future<List<TourModel>> getAllTourSearch(String search) async {
    Response response = await dio.get("${Endpointcustomer.search}$search");
    if (response.statusCode == 200) {
      List<dynamic> datas = response.data;
      return datas
          .map(
            (e) => TourModel.fromMap(e),
          )
          .toList();
    }
    return [];
  }
}
