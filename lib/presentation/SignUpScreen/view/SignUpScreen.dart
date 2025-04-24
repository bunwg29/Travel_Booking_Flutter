import 'package:book_tour/presentation/LoadingScreen.dart';
import 'package:book_tour/presentation/SignUpScreen/controller/ControllerSignUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Signupscreen extends GetView<Controllersignup> {
  const Signupscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const LoadingScreen()
          : Scaffold(
              backgroundColor: Colors.blue,
              body: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  height: 1100.h,
                  child: Stack(
                    children: [
                      Image.asset("assets/img/img5.png"),
                      Positioned(
                        top: 240.h,
                        child: Container(
                          height: 1100.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.w, vertical: 60.h),
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50.r),
                                  topRight: Radius.circular(50.r))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 32.sp),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Text(
                                "Create an account, it’s free",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp),
                              ),
                              SizedBox(
                                height: 40.h,
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
                                    controller: controller.username,
                                    decoration:
                                        const InputDecoration(hintText: "Your name"),
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
                                    controller: controller.pass1,
                                    decoration: const InputDecoration(
                                        hintText: "Password"),
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
                                    controller: controller.phone,
                                    decoration: const InputDecoration(
                                        hintText: "Phone"),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              SizedBox(
                                  width: double.infinity,
                                  height: 60.h,
                                  child: ElevatedButton(
                                      onPressed: () =>
                                          controller.signUp(context),
                                      child: const Text("Sign Up"))),
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
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
                              SizedBox(
                                height: 80.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Have account?",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14.sp),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  GestureDetector(
                                    onTap: () => Get.back(),
                                    child: Text(
                                      "Sign In",
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
            ),
    );
  }
}
