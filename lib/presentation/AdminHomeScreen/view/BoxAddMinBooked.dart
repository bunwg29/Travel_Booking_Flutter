import 'package:book_tour/config/routes/appRoutes.dart';
import 'package:book_tour/core/BaseWidget/BoxBookTour.dart';
import 'package:book_tour/presentation/AdminHomeScreen/controller/ControllerAdminHome.dart';
import 'package:book_tour/presentation/LoadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BoxAddMinBooked extends GetView<Controlleradminhome> {
  const BoxAddMinBooked({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const LoadingScreen()
          : Container(
              padding: EdgeInsets.only(top: 10.h),
              width: double.infinity,
              child: RefreshIndicator(
                onRefresh: () => controller.getAllBookedTour(),
                child: ListView.builder(
                    itemCount: controller.bookeds.length,
                    itemBuilder: (context, index) => BoxBookTour(
                          bookTour: controller.bookeds[index],
                          event: () => Get.toNamed(AppRoutes.adminDetailBooked,
                              arguments: controller.bookeds[index]),
                        )),
              ),
            ),
    );
  }
}
