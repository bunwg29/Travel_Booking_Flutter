import 'package:book_tour/core/BaseWidget/BoxTopDetailTour.dart';
import 'package:book_tour/core/Enum/EnumType.dart';
import 'package:book_tour/presentation/AdminDetailTourScreen/controller/ControllerAdminDetailTour.dart';
import 'package:book_tour/presentation/LoadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Admindetailtourscreen extends GetView<Controlleradmindetailtour> {
  const Admindetailtourscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const LoadingScreen()
          : Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    BoxTopDetailTour(tour: controller.tour.value),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.w,
                          ),
                          Text(
                            "Title",
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          TextField(
                            controller: controller.titleController,
                            decoration:
                                const InputDecoration(hintText: "Title"),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Text(
                            "Desciption",
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          TextField(
                            controller: controller.descriptionController,
                            maxLines: 3,
                            decoration:
                                const InputDecoration(hintText: "Desciption"),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Price per pax",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              TextField(
                                controller: controller.priceController,
                                decoration:
                                    const InputDecoration(hintText: "80k/pax"),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          DropdownButtonFormField<Enumtype>(
                            value: controller.enumtype,
                            decoration: InputDecoration(
                              labelText: "Choose type",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                            ),
                            items: Enumtype.values.map((Enumtype value) {
                              return DropdownMenuItem<Enumtype>(
                                value: value,
                                child: Text(
                                  value.name,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList(),
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                            onChanged: (value) {
                              controller.enumtype = value;
                            },
                          ),
                          SizedBox(
                            height: 15.w,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                    height: 60.h,
                                    child: ElevatedButton(
                                        onPressed: () =>
                                            controller.clickSave(context),
                                        child: const Text("Save"))),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Expanded(
                                child: SizedBox(
                                    height: 60.h,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red),
                                        onPressed: () =>
                                            controller.clickDelete(context),
                                        child: const Text("Delete"))),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.w,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
