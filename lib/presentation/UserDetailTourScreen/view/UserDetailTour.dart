import 'package:book_tour/core/BaseWidget/BoxTopDetailTour.dart';
import 'package:book_tour/core/BaseWidget/CacheImgCustom.dart';
import 'package:book_tour/core/BaseWidget/CustomDropdown.dart';
import 'package:book_tour/core/Enum/EnumPayment.dart';
import 'package:book_tour/presentation/LoadingScreen.dart';
import 'package:book_tour/presentation/UserDetailTourScreen/controller/ControllerUserDetailTour.dart';
import 'package:book_tour/presentation/UserDetailTourScreen/view/BoxNumPax.dart';
import 'package:book_tour/presentation/UserDetailTourScreen/view/BoxRundown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UserDetailTourScreen extends GetView<Controlleruserdetailtour> {
  const UserDetailTourScreen({super.key});

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
                      BoxTopDetailTour(tour: controller.tour.value),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Desciption",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.sp),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.viewAllRate();
                                    showModalBottomSheet(
                                      context: context,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20)),
                                      ),
                                      builder: (context) => Obx(
                                        () => controller.isLoadingRate.value
                                            ? const LoadingScreen()
                                            : SizedBox(
                                                height: Get.height * .6,
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: 20.h,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    20.w),
                                                        child: Text(
                                                          'Post Review',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 20.sp,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: ListView.builder(
                                                          itemCount: controller
                                                              .rates.length,
                                                          itemBuilder: (context,
                                                                  index) =>
                                                              ListTile(
                                                            leading: ClipOval(
                                                              child:
                                                                  CircleAvatar(
                                                                child: controller
                                                                            .rates[
                                                                                index]
                                                                            .customer!
                                                                            .img !=
                                                                        null
                                                                    ? SizedBox(
                                                                        width:
                                                                            50.w,
                                                                        height:
                                                                            50.w,
                                                                        child: CacheImgCustom(
                                                                            url:
                                                                                controller.rates[index].customer!.img!),
                                                                      )
                                                                    : Image.asset(
                                                                        'assets/img/avt.png'),
                                                              ),
                                                            ),
                                                            title: Text(
                                                              controller
                                                                  .rates[index]
                                                                  .customer!
                                                                  .username!,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            subtitle: Text(
                                                              "${controller.rates[index].comment!} \n${controller.rates[index].createdAt!}",
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            trailing: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Text(
                                                                  "${controller.rates[index].rateStar}",
                                                                  style:
                                                                      const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                    width: 4),
                                                                const Icon(
                                                                    Icons.star,
                                                                    color: Colors
                                                                        .amber,
                                                                    size: 20),
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
                                    );
                                  },
                                  child: Text(
                                    "Reviews",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.sp,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13.sp),
                                controller.tour.value.description!),
                            SizedBox(
                              height: 30.h,
                            ),
                            BoxNumPax(
                              tourModel: controller.tour.value,
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
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomDropdown(
                              value: null,
                              items: Enumpayment.values,
                              label: "Select menthod payment",
                              onChanged: (p0) => controller.enumpayment = p0,
                              itemLabelBuilder: (p0) => p0!.name,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            BoxRundown(
                              tourModel: controller.tour.value,
                            ),
                            SizedBox(
                              height: 20.h,
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
                        "Total money : ${controller.totalMoney.value}\$",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 22.sp),
                      ),
                    ),
                    SizedBox(
                      height: 56.h,
                      width: 100.w,
                      child: ElevatedButton(
                          onPressed: () => controller.clickBook(context),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                          child: const Text("Book")),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
