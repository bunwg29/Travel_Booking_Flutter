import 'dart:io';

import 'package:book_tour/core/BaseWidget/DialogCustom.dart';
import 'package:book_tour/data/repository/RepositoryProfileDetail.dart';
import 'package:book_tour/model/CustomerModel.dart';
import 'package:book_tour/model/RequetsUpdateCustomer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

class Controllerdetailprofilescreen extends GetxController {
  Repositoryprofiledetail repositoryprofiledetail =
      GetIt.I<Repositoryprofiledetail>();
  final customer = (Get.arguments as CustomerModel).obs;
  Rxn<File> pickedImage = Rxn<File>();

  final isLoading = false.obs;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  @override
  void onInit() {
    nameController.text = customer.value.username!;
    phoneController.text = customer.value.phone!;
    super.onInit();
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      pickedImage.value = File(image.path);
    }
  }

  void clickSave(BuildContext context) async {
    String? avt;
    final request = RequetsUpdateCustomer();
    isLoading.value = true;
    if (pickedImage.value != null) {
      await repositoryprofiledetail.uploadAvt(
        imageFile: pickedImage.value!,
        success: (img) => avt = img,
        error: () =>
            Dialogcustom.show(context, "Upload img error", isSuccess: false),
      );
    }
    if (avt != null) {
      request.img = avt;
    }
    request.idUser = customer.value.user!.id!;
    request.username = nameController.text;
    request.phone = phoneController.text;

    await repositoryprofiledetail.updateCustomer(
      request: request,
      success: (customer) {
        // if(customer.img!= null){
        //   pickedImage.value =
        // }
        nameController.text = customer.username!;
        phoneController.text = customer.phone!;
        Dialogcustom.show(context, "Update customer success");
      },
      error: () =>
          Dialogcustom.show(context, "Update customer error", isSuccess: false),
    );

    isLoading.value = false;
  }
}
