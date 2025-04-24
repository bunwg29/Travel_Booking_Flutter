import 'package:book_tour/data/domain/EndpointCustomer.dart';
import 'package:book_tour/model/CustomerModel.dart';
import 'package:dio/dio.dart';

class Repositoryuserprofile {
  final Dio dio;
  Repositoryuserprofile({required this.dio});

  Future<CustomerModel?> getMe() async {
    Response response = await dio.post(Endpointcustomer.me);
    if (response.statusCode == 200) {
      return CustomerModel.fromMap(response.data);
    }
    return null;
  }
}
