import 'package:book_tour/config/routes/appRoutes.dart';
import 'package:book_tour/presentation/AdminHomeScreen/controller/ControllerAdminHome.dart';
import 'package:book_tour/presentation/AdminHomeScreen/view/BoxAddMinBooked.dart';
import 'package:book_tour/presentation/AdminHomeScreen/view/BoxAdminAllTour.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdminHomeScreen extends GetView<Controlleradminhome> {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.blue,
          title: const Text("Wellcome ADMIN"),
          actions: [
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.adminAddTour),
              child: Container(
                margin: EdgeInsets.only(right: 10.w),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: Image.asset(
                  "assets/icon/icon3.png",
                  color: Colors.blue,
                ),
              ),
            )
          ],
        ),
        body: Obx(() => controller.page.value == 0
            ? const BoxAdminAllTour()
            : const BoxAddMinBooked()),
        bottomNavigationBar: Obx(
          () => Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black87, // Nền tối
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                  backgroundColor: Colors.transparent, // Dùng màu từ Container
                  currentIndex: controller.page.value,
                  onTap: (index) {
                    controller.page.value = index;
                  },
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.grey[400],
                  showUnselectedLabels: true,
                  type: BottomNavigationBarType.fixed,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'All Tour',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'Booked Tour',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
