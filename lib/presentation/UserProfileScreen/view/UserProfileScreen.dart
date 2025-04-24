import 'package:book_tour/config/routes/appRoutes.dart';
import 'package:book_tour/core/BaseWidget/CacheImgCustom.dart';
import 'package:book_tour/presentation/LoadingScreen.dart';
import 'package:book_tour/presentation/UserProfileScreen/controller/ControllerUserProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Userprofilescreen extends GetView<Controlleruserprofile> {
  const Userprofilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const LoadingScreen()
          : Scaffold(
              backgroundColor: Colors.blue,
              body: RefreshIndicator(
                onRefresh: () async => controller.getMe(),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: Get.height,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 160.h,
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50.4),
                                    topRight: Radius.circular(50.4))),
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.w, vertical: 30.w),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => Get.toNamed(
                                        AppRoutes.detailProfile,
                                        arguments: controller.cutomer.value),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w, vertical: 20.w),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.r)),
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                                blurRadius: 10,
                                                color: Colors.grey,
                                                spreadRadius: 0.5)
                                          ]),
                                      child: Row(
                                        children: [
                                          ClipOval(
                                              child: controller
                                                          .cutomer.value!.img ==
                                                      null
                                                  ? Image.asset(
                                                      width: 60.w,
                                                      height: 60.w,
                                                      "assets/img/avt.png")
                                                  : SizedBox(
                                                      width: 60.w,
                                                      height: 60.w,
                                                      child: CacheImgCustom(
                                                          url: controller
                                                              .cutomer
                                                              .value!
                                                              .img!),
                                                    )),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${controller.cutomer.value!.username}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16.sp),
                                              ),
                                              Text("Edit Profile",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 10.sp))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
