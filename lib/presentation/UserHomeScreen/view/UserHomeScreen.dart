import 'package:book_tour/config/routes/appRoutes.dart';
import 'package:book_tour/presentation/LoadingScreen.dart';
import 'package:book_tour/presentation/UserHomeScreen/controller/ControllerUserHome.dart';
import 'package:book_tour/presentation/UserHomeScreen/view/BoxTourHot.dart';
import 'package:book_tour/presentation/UserHomeScreen/view/BoxTourRecommen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Userhomescreen extends GetView<Controlleruserhome> {
  const Userhomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const LoadingScreen()
          : Scaffold(
              backgroundColor: Colors.white,
              body: CustomScrollView(slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40.h,
                            ),
                            GestureDetector(
                              onTap: () => Get.toNamed(AppRoutes.search),
                              child: const AbsorbPointer(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Search",
                                    suffixIcon: Icon(Icons.search),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Tour Hot",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.w),
                        child: SizedBox(
                          height: 279.w,
                          child: Obx(
                            () => ListView.builder(
                              itemCount: controller.tours.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.only(right: 20.w),
                                child: GestureDetector(
                                    onTap: () => Get.toNamed(
                                        AppRoutes.userDetaiTour,
                                        arguments: controller.tours[index]),
                                    child: BoxTourHot(
                                      tourModel: controller.tours[index],
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Recommended",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Obx(
                  () => SliverList.builder(
                    itemCount: controller.tours.length,
                    itemBuilder: (context, index) => GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.userDetaiTour,
                            arguments: controller.tours[index]),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 30.w, right: 30.w, bottom: 20),
                          child: BoxTourRecommen(
                            tourModel: controller.tours[index],
                          ),
                        )),
                  ),
                )
              ]),
            ),
    );
  }
}
