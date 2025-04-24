import 'dart:io';

import 'package:book_tour/data/domain/EndpointAdmin.dart';
import 'package:book_tour/model/TourModel.dart';
import 'package:dio/dio.dart';

class Repositoryadminaddtour {
  final Dio dio;
  Repositoryadminaddtour({required this.dio});

  Future<void> addTour(
      {required TourModel data,
      required Function() success,
      required Function() error}) async {
    print(data.toJson());
    Response response =
        await dio.post(EndpointAdmin.addTour, data: data.toJson());
    if (response.statusCode == 200) {
      success();
    } else {
      error();
    }
  }

  Future<void> uploadImg({
    required List<File> data,
    required Function(List<String> imageUrls) success,
    required Function(String message) error,
  }) async {
    try {
      List<MultipartFile> files = [];

      for (File file in data) {
        String fileName = file.path.split('/').last;
        files.add(
          await MultipartFile.fromFile(
            file.path,
            filename: fileName,
          ),
        );
      }

      FormData formData = FormData.fromMap({
        "files": files,
      });

      Response response = await dio.post(
        EndpointAdmin.uploadImg, 
        data: formData,
        options: Options(
          contentType: "multipart/form-data",
        ),
      );

      if (response.statusCode == 200 && response.data["images"] != null) {
        List<String> urls = List<String>.from(response.data["images"]);
        success(urls);
      } else {
        error("Upload failed or no image URLs returned.");
      }
    } catch (e) {
      print("Upload error: $e");
      error(e.toString());
    }
  }
}
