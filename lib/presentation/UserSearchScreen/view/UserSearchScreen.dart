import 'package:book_tour/config/routes/appRoutes.dart';
import 'package:book_tour/presentation/UserHomeScreen/view/BoxTourRecommen.dart';
import 'package:book_tour/presentation/UserSearchScreen/controller/ControllerUserSearch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Usersearchscreen extends GetView<Controllerusersearch> {
  const Usersearchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            TextField(
              controller: controller.searchController,
              onChanged: (value) {
                controller.clickSearch(value);
              },
              decoration: const InputDecoration(
                hintText: "Search",
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            Obx(
              () => Expanded(
                child: ListView.builder(
                  itemCount: controller.tours.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.userDetaiTour,
                            arguments: controller.tours[index]),
                        child: BoxTourRecommen(
                            tourModel: controller.tours[index])),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
