import 'package:book_tour/core/BaseWidget/DialogCustom.dart';
import 'package:book_tour/core/Enum/EnumStatusBook.dart';
import 'package:book_tour/data/repository/RepositoryAdminBookedDetail.dart';
import 'package:book_tour/model/BookTourModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class Controlleradmindetailbooked extends GetxController {
  final isLoading = false.obs;

  Repositoryadminbookeddetail repositoryadminbookeddetail =
      GetIt.I<Repositoryadminbookeddetail>();
  final booked = (Get.arguments as Booktourmodel).obs;

  void clickConfirm(BuildContext context) async {
    isLoading.value = true;
    await repositoryadminbookeddetail.confirm(
      status: Enumstatusbook.COMFIRMED.name,
      id: booked.value.id!,
      sucess: (booked) {
        this.booked.value = booked;
        Dialogcustom.show(context, "Confirm sucess");
      },
      error: () =>
          Dialogcustom.show(context, "Confirm error", isSuccess: false),
    );
    isLoading.value = false;
  }
}
