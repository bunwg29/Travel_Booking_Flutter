import 'dart:io';

import 'package:book_tour/data/domain/EndpointCustomer.dart';
import 'package:book_tour/model/CustomerModel.dart';
import 'package:book_tour/model/RequetsUpdateCustomer.dart';
import 'package:dio/dio.dart';

class Repositoryprofiledetail {
  final Dio dio;
  Repositoryprofiledetail({required this.dio});

  Future<void> updateCustomer(
      {required RequetsUpdateCustomer request,
      required Function(CustomerModel customer) success,
      required Function() error}) async {
    print(request.toJson());
    Response response =
        await dio.put(Endpointcustomer.updateCustomer, data: request.toJson());
    if (response.statusCode == 200) {
      final customerModel = CustomerModel.fromMap(response.data);
      success(customerModel);
    } else {
      error();
    }
  }

  Future<void> uploadAvt(
      {required File imageFile,
      required Function(String img) success,
      required Function() error}) async {
    try {
      String fileName = imageFile.path.split('/').last;

      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          imageFile.path,
          filename: fileName,
        ),
      });

      Response response = await dio.post(
        Endpointcustomer.uploadAvt,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        String img = data["img"];
        success(img);
      } else {
        error();
      }
    } catch (e) {
      print("Upload failed: $e");
      error();
    }
  }
}
