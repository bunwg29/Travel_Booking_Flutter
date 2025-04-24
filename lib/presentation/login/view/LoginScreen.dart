import 'package:book_tour/config/routes/appRoutes.dart';
import 'package:book_tour/presentation/LoadingScreen.dart';
import 'package:book_tour/presentation/login/controller/ControllerLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Loginscreen extends GetView<Controllerlogin> {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const LoadingScreen()
          : Scaffold(
              backgroundColor: Colors.blue,
              body: SizedBox(
                width: double.infinity,
                height: Get.height,
                child: Stack(
                  children: [
                    Image.asset("assets/img/img4.png"),
                    Positioned(
                      top: 240.h,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.w, vertical: 60.h),
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.r),
                                topRight: Radius.circular(50.r))),
                        height: Get.height - 240.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sign In",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 32.sp),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Text(
                              "Please enter a valid account",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 14.sp),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Email",
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                TextField(
                                  controller: controller.email,
                                  decoration: const InputDecoration(
                                      hintText: "youremails@yahoo.com"),
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
                                  "Password",
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                TextField(
                                  controller: controller.password,
                                  decoration: const InputDecoration(
                                      hintText: "Password"),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            SizedBox(
                                width: double.infinity,
                                height: 60.h,
                                child: ElevatedButton(
                                    onPressed: () =>
                                        controller.clickLogin(context),
                                    child: const Text("Sign In"))),
                            SizedBox(
                              height: 22.h,
                            ),
                            const Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                    endIndent: 10,
                                  ),
                                ),
                                Text(
                                  "OR",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                    indent: 10,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don’t have account?",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14.sp),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                GestureDetector(
                                  onTap: () => Get.toNamed(AppRoutes.signUp),
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp),
                                  ),
                                ),
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
    );
  }
}
