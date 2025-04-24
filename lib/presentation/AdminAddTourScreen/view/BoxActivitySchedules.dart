import 'package:book_tour/presentation/AdminAddTourScreen/controller/ControllerAdminAddTour.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class BoxActivitySchedules extends GetView<Controlleradminaddtour> {
  const BoxActivitySchedules({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Activity Schedule",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 20.h,
        ),
        Obx(() => Column(
              // ignore: invalid_use_of_protected_member
              children: controller.boxSchedules.value,
            )),
      ],
    );
  }
}

// ignore: must_be_immutable
class BoxActivitySchedule extends StatelessWidget {
  BoxActivitySchedule(
      {super.key,
      required this.contentController,
      required this.titleController});
  TextEditingController titleController;
  TextEditingController contentController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Title",
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 8.h,
        ),
        TextField(
          controller: titleController,
          decoration: const InputDecoration(hintText: "Title"),
        ),
        SizedBox(
          height: 18.h,
        ),
        Text(
          "Activity Schedule Content",
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 8.h,
        ),
        TextField(
          controller: contentController,
          maxLines: 3,
          decoration:
              const InputDecoration(hintText: "Activity Schedule Content"),
        ),
        SizedBox(
          height: 18.h,
        ),
      ],
    );
  }
}
