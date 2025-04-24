import 'package:book_tour/config/routes/appRoutes.dart';
import 'package:book_tour/presentation/AdminHomeScreen/controller/ControllerAdminHome.dart';
import 'package:book_tour/presentation/LoadingScreen.dart';
import 'package:book_tour/presentation/UserHomeScreen/view/BoxTourRecommen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BoxAdminAllTour extends GetView<Controlleradminhome> {
  const BoxAdminAllTour({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => controller.getAllTour(),
      child: Obx(
        () => controller.isLoading.value
            ? const LoadingScreen()
            : SizedBox(
                width: double.infinity,
                child: ListView.builder(
                  itemCount: controller.tours.length,
                  itemBuilder: (context, index) => Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.w),
                    child: GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.adminDetailTour,
                            arguments: controller.tours[index]),
                        child: BoxTourRecommen(
                          tourModel: controller.tours[index],
                        )),
                  ),
                ),
              ),
      ),
    );
  }
}
