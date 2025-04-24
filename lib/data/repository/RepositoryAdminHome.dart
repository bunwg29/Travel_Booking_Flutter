import 'package:book_tour/data/domain/EndpointAdmin.dart';
import 'package:book_tour/model/BookTourModel.dart';
import 'package:book_tour/model/TourModel.dart';
import 'package:dio/dio.dart';

class Repositoryadminhome {
  final Dio dio;
  Repositoryadminhome({required this.dio});

  Future<List<TourModel>> getAllTour() async {
    Response response = await dio.get(EndpointAdmin.getAllTour);
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      print(data);
      return data.map((e) => TourModel.fromMap(e)).toList();
    }
    return [];
  }

  Future<List<Booktourmodel>> getAllBookedTour() async {
    Response response = await dio.get(EndpointAdmin.getAllBookedTour);
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.map((e) => Booktourmodel.fromMap(e)).toList();
    }
    return [];
  }
}
