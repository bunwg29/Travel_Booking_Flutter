import 'package:book_tour/core/BaseWidget/CacheImgCustom.dart';
import 'package:book_tour/presentation/DetailProfileScreen/controller/ControllerDetailScreen.dart';
import 'package:book_tour/presentation/LoadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Detailprofilescreen extends GetView<Controllerdetailprofilescreen> {
  const Detailprofilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const LoadingScreen()
          : Scaffold(
              backgroundColor: Colors.blue,
              body: Column(
                children: [
                  SizedBox(
                    height: 160.h,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 30.w),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.4),
                              topRight: Radius.circular(50.4))),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Account Info",
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r)),
                                border:
                                    Border.all(width: 1, color: Colors.grey)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 23.w, vertical: 15.w),
                            width: double.infinity,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 60.w,
                                  height: 60.w,
                                  child: GestureDetector(
                                    onTap: () => controller.pickImage(),
                                    child: Obx(() {
                                      if (controller.pickedImage.value !=
                                          null) {
                                        return ClipOval(
                                          child: Image.file(
                                            controller.pickedImage.value!,
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      } else if (controller
                                              .customer.value.img ==
                                          null) {
                                        return ClipOval(
                                          child: Image.asset(
                                            "assets/img/avt.png",
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      } else {
                                        return ClipOval(
                                            child: SizedBox(
                                          width: 60.w,
                                          height: 60.w,
                                          child: CacheImgCustom(
                                              url: controller
                                                  .customer.value.img!),
                                        ));
                                      }
                                    }),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Your Photo",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500)),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w300),
                                          "Adding a profile picture makes your profile more personalized.")
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              TextField(
                                controller: controller.nameController,
                                decoration: const InputDecoration(
                                    hintText: "Your name"),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Phone",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              TextField(
                                controller: controller.phoneController,
                                decoration:
                                    const InputDecoration(hintText: "Phone"),
                              ),
                            ],
                          ),
                          const Spacer(),
                          SizedBox(
                              width: double.infinity,
                              height: 60.h,
                              child: ElevatedButton(
                                  onPressed: () =>
                                      controller.clickSave(context),
                                  child: const Text("Save")))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
