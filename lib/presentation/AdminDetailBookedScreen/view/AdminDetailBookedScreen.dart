import 'package:book_tour/core/Enum/EnumStatusBook.dart';
import 'package:book_tour/presentation/AdminDetailBookedScreen/controller/ControllerAdminDetailBooked.dart';
import 'package:book_tour/presentation/LoadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Admindetailbookedscreen extends GetView<Controlleradmindetailbooked> {
  const Admindetailbookedscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const LoadingScreen()
          : Scaffold(
              body: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(15.w),
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Obx(
                      () => Table(
                        columnWidths: const {
                          0: IntrinsicColumnWidth(),
                          1: FlexColumnWidth(),
                        },
                        border: TableBorder.symmetric(
                          inside: BorderSide(
                              color: Colors.grey.shade300, width: 0.5),
                        ),
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: [
                          _buildStyledRow("👤 Created By",
                              controller.booked.value.createdBy!),
                          _buildStyledRow(
                              "📅 Created At",
                              DateFormat('dd/MM/yyyy HH:mm:ss').format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                      controller.booked.value.createdAt!))),
                          _buildStyledRow("📌 Name Tour", "Tour1"),
                          _buildStyledRow(
                              "📅 Date Go",
                              DateFormat('dd/MM/yyyy').format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                      controller.booked.value.dateStart!))),
                          _buildStyledRow("💰 Total Money",
                              "${controller.booked.value.totalMoney}\$"),
                          _buildStyledRow("💰 Payment Menthod",
                              controller.booked.value.paymentMethod!),
                          _buildStyledRow("👥 Count Member",
                              "${controller.booked.value.countMember}"),
                          _buildStyledRow(
                              "📌 Status", controller.booked.value.status!),
                          _buildStyledRow(
                              "👤 Modify At",
                              DateFormat('dd/MM/yyyy HH:mm:ss').format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                      controller.booked.value.updatedAt!))),
                          _buildStyledRow("📅 Modify By",
                              controller.booked.value.modifiedBy!),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              bottomSheet: Visibility(
                visible:
                    controller.booked.value.status == Enumstatusbook.WAIT.name,
                child: Container(
                    margin: EdgeInsets.all(20.w),
                    width: double.infinity,
                    height: 60.h,
                    child: ElevatedButton(
                        onPressed: () => controller.clickConfirm(context),
                        child: const Text("COFIRM"))),
              )),
    );
  }

  TableRow _buildStyledRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: Colors.grey.shade800,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15.sp,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
