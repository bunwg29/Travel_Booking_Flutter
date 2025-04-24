import 'package:book_tour/config/routes/appRoutes.dart';
import 'package:book_tour/core/BaseWidget/BoxBookTour.dart';
import 'package:book_tour/presentation/LoadingScreen.dart';
import 'package:book_tour/presentation/UserBookingScreen/controller/ControllerUserBooking.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Userbookingscreen extends GetView<Controlleruserbooking> {
  const Userbookingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const LoadingScreen()
          : RefreshIndicator(
              onRefresh: () async => controller.getAllBooked(),
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.bookeds.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {},
                    child: BoxBookTour(
                      bookTour: controller.bookeds[index],
                      event: () => Get.toNamed(AppRoutes.userDetailBooked,
                          arguments: controller.bookeds[index]),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
