import 'dart:convert';
import 'dart:io';

import 'package:book_tour/core/BaseWidget/DialogCustom.dart';
import 'package:book_tour/core/Enum/EnumType.dart';
import 'package:book_tour/core/util/izi_validate.dart';
import 'package:book_tour/data/repository/RepositoryAdminAddTour.dart';
import 'package:book_tour/model/ActivityScheduleModel.dart';
import 'package:book_tour/model/AddressModel.dart';
import 'package:book_tour/model/ProvinceVn.dart';
import 'package:book_tour/model/TourModel.dart';
import 'package:book_tour/presentation/AdminAddTourScreen/view/BoxActivitySchedules.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

class Controlleradminaddtour extends GetxController {
  Repositoryadminaddtour repositoryadminaddtour =
      GetIt.I<Repositoryadminaddtour>();

  final Rx<File?> selectedImage1 = Rx<File?>(null);
  final Rx<File?> selectedImage2 = Rx<File?>(null);
  final Rx<File?> selectedImage3 = Rx<File?>(null);
  final isLoading = false.obs;
  final activityTitleControllers = <TextEditingController>[].obs;
  final activityContentControllers = <TextEditingController>[].obs;
  final nameController = TextEditingController();
  final desciptionController = TextEditingController();
  final priceController = TextEditingController();
  final detailController = TextEditingController();

  Enumtype? enumtype;

  final boxSchedules = <BoxActivitySchedule>[].obs;

  final provinces = <ProvinceVn>[].obs;
  final districts = <Districts>[].obs;
  final towns = <Town>[].obs;
  final pathData = 'assets/data/ProvinceData.json';

  @override
  void onInit() {
    super.onInit();
    addBoxSchedule();
    setDN();
  }

  void setDN() async {
    String jsonString = await rootBundle.loadString(pathData);
    Map<String, dynamic> mapData = jsonDecode(jsonString);
    List<dynamic> listData = mapData['province'];

    List<ProvinceVn> dt = listData.map((e) => ProvinceVn.fromMap(e)).toList();
    province = dt.firstWhere(
      (element) => element.id == "48",
    );
    getDistricts();
  }

  void clickAddTour(BuildContext context) async {
    if (checkValidate(context)) {
      isLoading.value = true;
      var fileUpload = <String>[];
      List<File> files = [
        selectedImage1.value!,
        selectedImage2.value!,
        selectedImage3.value!
      ];
      await repositoryadminaddtour.uploadImg(
        data: files,
        success: (imageUrls) {
          fileUpload = imageUrls;
        },
        error: (message) => Dialogcustom.show(context, "Upload image error"),
      );
      if (fileUpload.isNotEmpty) {
        final activityScheduleModels = <ActivityScheduleModel>[];
        AddressModel addressModel = AddressModel(
          detail: detailController.text,
          town: town!.name,
          district: district!.name,
          province: province!.name,
        );
        for (int i = 0; i < activityTitleControllers.length; i++) {
          String titel = activityTitleControllers[i].text;
          String content = activityContentControllers[i].text;
          activityScheduleModels
              .add(ActivityScheduleModel(title: titel, description: content));
        }

        TourModel tour = TourModel(
            imgs: fileUpload,
            address: addressModel,
            name: nameController.text,
            description: desciptionController.text,
            type: enumtype!.name,
            activitySchedules: activityScheduleModels,
            price: int.parse(priceController.text));
        await repositoryadminaddtour.addTour(
            data: tour,
            success: () => Dialogcustom.show(context, "Create tour success"),
            error: () => Dialogcustom.show(context, "Create tour success",
                isSuccess: false));
      }

      isLoading.value = false;
    }
  }

  bool checkValidate(BuildContext context) {
    if (selectedImage1.value == null ||
        selectedImage2.value == null ||
        selectedImage3.value == null) {
      Dialogcustom.show(context, "Please select all 3 photos", isSuccess: false);
      return false;
    }
    if (IZIValidate.nullOrEmpty(nameController.value)) {
      Dialogcustom.show(context, "Please enter name");
      return false;
    }
    if (IZIValidate.nullOrEmpty(priceController.value)) {
      Dialogcustom.show(context, "Please enter price");
      return false;
    }
    if (IZIValidate.nullOrEmpty(desciptionController.value)) {
      Dialogcustom.show(context, "Please enter description");
      return false;
    }
    if (enumtype == null) {
      Dialogcustom.show(context, "Please select type");
      return false;
    }
    if (enumtype == null) {
      Dialogcustom.show(context, "Please select type");
      return false;
    }
    if (IZIValidate.nullOrEmpty(detailController.value)) {
      Dialogcustom.show(context, "Please enter specific address");
      return false;
    }
    return true;
  }

  void addBoxSchedule() {
    final titleController = TextEditingController();
    final contentController = TextEditingController();
    activityTitleControllers.add(titleController);
    activityContentControllers.add(contentController);
    boxSchedules.add(BoxActivitySchedule(
      titleController: titleController,
      contentController: contentController,
    ));
  }

  void getDistricts() async {
    if (province != null) {
      String jsonString = await rootBundle.loadString(pathData);
      Map<String, dynamic> mapData = jsonDecode(jsonString);
      List<dynamic> listData = mapData['district'];
      districts.clear();
      districts.value = listData
          .where((element) => element['idProvince'] == province!.id)
          .map((e) => Districts.fromMap(e))
          .toList();
      district = districts.first;
      getTowns();
    }
  }

  void getTowns() async {
    if (district != null) {
      String jsonString = await rootBundle.loadString(pathData);
      Map<String, dynamic> mapData = jsonDecode(jsonString);
      List<dynamic> listData = mapData['commune'];
      towns.clear();
      towns.value = listData
          .where((element) => element['idDistrict'] == district!.idDistrict)
          .map((e) => Town.fromMap(e))
          .toList();
      town = towns.first;
    }
  }

  Future<void> pickImage(Rx<File?> file) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      file.value = File(pickedFile.path);
    }
  }

  ProvinceVn? province;
  Districts? district;
  Town? town;
}
