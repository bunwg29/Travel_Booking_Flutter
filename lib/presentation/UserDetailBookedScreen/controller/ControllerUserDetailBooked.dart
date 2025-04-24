import 'package:book_tour/core/BaseWidget/DialogCustom.dart';
import 'package:book_tour/core/Enum/EnumStatusBook.dart';
import 'package:book_tour/data/repository/RepositoryUserDetailBooked.dart';
import 'package:book_tour/model/BookTourModel.dart';
import 'package:book_tour/model/RequestAddRate.dart';
import 'package:book_tour/model/RequestUpdateBookTour.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class Controlleruserdetailbooked extends GetxController {
  Repositoryuserdetailbooked repositoryuserdetailbooked =
      GetIt.I<Repositoryuserdetailbooked>();
  var bookTour = Get.arguments as Booktourmodel;

  final isLoading = false.obs;
  final selectedDate = Rx<DateTime?>(null);
  final count = 0.obs;
  final totalMoney = 0.obs;
  final price = 0.obs;
  final createAt = "".obs;
  final createBy = "".obs;
  final updateAt = "".obs;
  final updateby = "".obs;
  final status = "".obs;

  double rateStar = 0;
  final comment = TextEditingController();

  @override
  void onInit() {
    setData();

    super.onInit();
  }

  void clickAddRate(BuildContext context) async {
    final requestAddRate = Requestaddrate(
        idTour: bookTour.tour!.id!, rateStar: rateStar, comment: comment.text);
    await repositoryuserdetailbooked.addRate(
      success: () => Dialogcustom.show(context, "Rate success"),
      data: requestAddRate,
      e: () => Dialogcustom.show(context, "loi"),
    );
  }

  void setData() {
    selectedDate.value =
        DateTime.fromMillisecondsSinceEpoch(bookTour.dateStart!);
    count.value = bookTour.countMember!;
    totalMoney.value = bookTour.totalMoney!;
    price.value = bookTour.tour!.price!;
    createBy.value = bookTour.createdBy!;
    updateby.value = bookTour.modifiedBy!;
    status.value = bookTour.status!;
    createAt.value =
        DateTime.fromMillisecondsSinceEpoch(bookTour.createdAt!).toString();
    updateAt.value =
        DateTime.fromMillisecondsSinceEpoch(bookTour.updatedAt!).toString();
  }

  void clickCancle(BuildContext context) async {
    isLoading.value = true;
    await repositoryuserdetailbooked.updateStatus(
      status: Enumstatusbook.CANCELLED.name,
      id: bookTour.id!,
      success: (booked) {
        bookTour = booked;
        setData();
        Dialogcustom.show(context, "Cancel success");
      },
      error: () => Dialogcustom.show(context, "Cancle error", isSuccess: false),
    );
    isLoading.value = false;
  }

  void clickupdate(BuildContext context) async {
    isLoading.value = true;
    final request = Requestupdatebooktour(
        id: bookTour.id,
        countMember: count.value,
        dateStart: selectedDate.value,
        totalMoney: totalMoney.value);
    await repositoryuserdetailbooked.updateTour(
      data: request,
      success: (booked) {
        bookTour = booked;
        setData();
        Dialogcustom.show(context, "Update success");
      },
      error: () => Dialogcustom.show(context, "Update error", isSuccess: false),
    );
    isLoading.value = false;
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
    totalMoney.value = count.value * price.value;
  }
}
