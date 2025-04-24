import 'package:book_tour/core/BaseWidget/BoxTopDetailTour.dart';
import 'package:book_tour/core/Enum/EnumStatusBook.dart';
import 'package:book_tour/presentation/LoadingScreen.dart';
import 'package:book_tour/presentation/UserDetailBookedScreen/controller/ControllerUserDetailBooked.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Userdetailbookedscreen extends GetView<Controlleruserdetailbooked> {
  const Userdetailbookedscreen({super.key});

  void showReviewBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: Get.height * .4,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Rate Tour",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.black,
                ),
                onRatingUpdate: (rating) {
                  controller.rateStar = rating;
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller.comment,
                decoration: const InputDecoration(
                  hintText: "Enter comment",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const Spacer(),
              SizedBox(
                height: 50.h,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.clickAddRate(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: const Text("Send Rate"),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

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
                    children: [
                      BoxTopDetailTour(tour: controller.bookTour.tour!),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: controller.bookTour.status ==
                                          Enumstatusbook.WAIT.name
                                      ? Colors.amber
                                      : controller.bookTour.status ==
                                              Enumstatusbook.COMFIRMED.name
                                          ? Colors.green
                                          : Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7.r))),
                              padding: EdgeInsets.symmetric(
                                  vertical: 6.w, horizontal: 12.w),
                              child: Text("${controller.bookTour.status}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w300)),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 22, vertical: 15),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.r)),
                                  border: Border.all(
                                      width: 1, color: Colors.black)),
                              width: double.infinity,
                              height: 120.h,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Number of pax",
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                              "${controller.bookTour.tour!.price}/\$",
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500)),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Text("/pax",
                                              style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w300))
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
                                                    const BorderRadius.all(
                                                        Radius.circular(100)),
                                                border: Border.all(width: 1)),
                                            child: SizedBox(
                                                width: 20.w,
                                                height: 20.w,
                                                child: Image.asset(
                                                    "assets/icon/icon2.png"))),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Obx(() => Text(
                                          controller.count.value.toString())),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      GestureDetector(
                                        onTap: () => controller.clickPlus(),
                                        child: Container(
                                            padding: const EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(100)),
                                                border: Border.all(width: 1)),
                                            child: SizedBox(
                                                width: 20.w,
                                                height: 20.w,
                                                child: Image.asset(
                                                    "assets/icon/icon3.png"))),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Text("Select travel date",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp)),
                            SizedBox(
                              height: 10.h,
                            ),
                            GestureDetector(
                              onTap: () => controller.clickSelectDate(context),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey, width: 1.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Obx(
                                      () => Text(
                                        controller.selectedDate.value != null
                                            ? DateFormat('dd/MM/yyyy').format(
                                                controller.selectedDate.value!)
                                            : 'Select travel date',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    const Icon(Icons.calendar_today,
                                        size: 20, color: Colors.grey),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                const Text("Created by :"),
                                const SizedBox(
                                  width: 10,
                                ),
                                Obx(() => Text(controller.createBy.value)),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text("Created at :"),
                                const SizedBox(
                                  width: 10,
                                ),
                                Obx(() => Text(controller.createAt.value)),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text("Modify by :"),
                                const SizedBox(
                                  width: 10,
                                ),
                                Obx(() => Text(controller.updateby.value)),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text("Modify at :"),
                                const SizedBox(
                                  width: 10,
                                ),
                                Obx(() => Text(controller.updateAt.value)),
                              ],
                            ),
                            SizedBox(
                              height: 50.h,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ]),
              bottomNavigationBar: Container(
                width: double.infinity,
                height: 100.h,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey)]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Obx(
                      () => Text(
                        "${controller.totalMoney.value}\$",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 22.sp),
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible:
                            controller.status.value == Enumstatusbook.WAIT.name,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 56.h,
                              width: 100.w,
                              child: ElevatedButton(
                                  onPressed: () =>
                                      controller.clickupdate(context),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.yellow),
                                  child: const Text("Save")),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              height: 56.h,
                              width: 120.w,
                              child: ElevatedButton(
                                  onPressed: () =>
                                      controller.clickCancle(context),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red),
                                  child: const Text("Cancel")),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible: controller.status.value ==
                            Enumstatusbook.COMFIRMED.name,
                        child: SizedBox(
                          height: 56.h,
                          width: 100.w,
                          child: ElevatedButton(
                              onPressed: () => showReviewBottomSheet(context),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red),
                              child: const Text("Rate")),
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
