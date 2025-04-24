import 'package:book_tour/core/BaseWidget/DialogCustom.dart';
import 'package:book_tour/core/Enum/EnumPayment.dart';
import 'package:book_tour/data/repository/RepositoryUserDetailTour.dart';
import 'package:book_tour/model/RateModel.dart';
import 'package:book_tour/model/RequestCreateBooking.dart';
import 'package:book_tour/model/TourModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class Controlleruserdetailtour extends GetxController {
  Repositoryuserdetailtour repositoryuserdetailtour =
      GetIt.I<Repositoryuserdetailtour>();
  final selectedDate = Rx<DateTime?>(null);
  final tour = (Get.arguments as TourModel).obs;
  final isLoadingRate = false.obs;
  final isLoading = false.obs;
  final rates = <RateModel>[].obs;
  Enumpayment? enumpayment;

  final count = 1.obs;
  final totalMoney = 0.obs;

  @override
  void onInit() {
    setTotalMoney();
    super.onInit();
  }

  void clickBook(BuildContext context) async {
    if (validateBook(context)) {
      isLoading.value = true;
      final request = RequestCreateBooking(
          idTour: tour.value.id,
          countMember: count.value,
          dateStart: selectedDate.value,
          paymentMethod: enumpayment!.name,
          totalMoney: totalMoney.value);
      repositoryuserdetailtour.bookTour(
          data: request,
          success: () => Dialogcustom.show(context, "Book success"),
          error: () =>
              Dialogcustom.show(context, "Book error", isSuccess: false));
      isLoading.value = false;
    }
  }

  bool validateBook(BuildContext context) {
    if (selectedDate.value == null) {
      Dialogcustom.show(context, "Select travel date", isSuccess: false);
      return false;
    } else if (enumpayment == null) {
      Dialogcustom.show(context, "Select menthod payment", isSuccess: false);
      return false;
    }
    return true;
  }

  void viewAllRate() async {
    isLoadingRate.value = true;
    rates.clear();
    rates.addAll(await repositoryuserdetailtour.getAllRate(tour.value.id!));
    isLoadingRate.value = false;
  }

  void clickSelectDate(BuildContext context) async {
    selectedDate.value = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
  }

  void clickPlus() {
    count.value++;
    setTotalMoney();
  }

  void minus() {
    if (count > 1) {
      count.value--;
      setTotalMoney();
    }
  }

  void setTotalMoney() {
    totalMoney.value = count.value * tour.value.price!;
  }
}
