import 'package:book_tour/model/TourModel.dart';
import 'package:book_tour/presentation/UserDetailTourScreen/controller/ControllerUserDetailTour.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BoxNumPax extends GetView<Controlleruserdetailtour> {
  final TourModel tourModel;
  const BoxNumPax({super.key, required this.tourModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          border: Border.all(width: 1, color: Colors.black)),
      width: double.infinity,
      height: 120.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Number of pax",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  Text("${tourModel.price}\$",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w500)),
                  const SizedBox(
                    width: 5,
                  ),
                  Text("/pax",
                      style: TextStyle(
                          fontSize: 11.sp, fontWeight: FontWeight.w300))
                ],
              )
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => controller.minus(),
                child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                        border: Border.all(width: 1)),
                    child: SizedBox(
                        width: 20.w,
                        height: 20.w,
                        child: Image.asset("assets/icon/icon2.png"))),
              ),
              SizedBox(
                width: 10.w,
              ),
              Obx(() => Text(controller.count.value.toString())),
              SizedBox(
                width: 10.w,
              ),
              GestureDetector(
                onTap: () => controller.clickPlus(),
                child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                        border: Border.all(width: 1)),
                    child: SizedBox(
                        width: 20.w,
                        height: 20.w,
                        child: Image.asset("assets/icon/icon3.png"))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
