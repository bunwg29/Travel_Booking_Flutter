import 'package:book_tour/core/util/UtilColors.dart';
import 'package:book_tour/presentation/AdminAddTourScreen/controller/ControllerAdminAddTour.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class BoxSelectImgs extends StatelessWidget {
  const BoxSelectImgs({
    super.key,
    required this.controller,
  });

  final Controlleradminaddtour controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.w,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Obx(
            () => GestureDetector(
              onTap: () => controller.pickImage(controller.selectedImage1),
              child: Container(
                decoration: BoxDecoration(
                  color: UtilColors.colorTextField,
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                ),
                width: 180.w,
                height: double.infinity,
                child: controller.selectedImage1.value == null
                    ? const Icon(
                        Icons.image,
                        color: UtilColors.primaryKeyColor,
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.file(
                          controller.selectedImage1.value!,
                          fit: BoxFit.cover,
                          width: 180.w,
                          height: 120.w,
                        ),
                      ),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Obx(
            () => GestureDetector(
              onTap: () => controller.pickImage(controller.selectedImage2),
              child: Container(
                decoration: BoxDecoration(
                  color: UtilColors.colorTextField,
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                ),
                width: 180.w,
                height: double.infinity,
                child: controller.selectedImage2.value == null
                    ? const Icon(
                        Icons.image,
                        color: UtilColors.primaryKeyColor,
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.file(
                          controller.selectedImage2.value!,
                          fit: BoxFit.cover,
                          width: 180.w,
                          height: 120.w,
                        ),
                      ),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Obx(
            () => GestureDetector(
              onTap: () => controller.pickImage(controller.selectedImage3),
              child: Container(
                decoration: BoxDecoration(
                  color: UtilColors.colorTextField,
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                ),
                width: 180.w,
                height: double.infinity,
                child: controller.selectedImage3.value == null
                    ? const Icon(
                        Icons.image,
                        color: UtilColors.primaryKeyColor,
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.file(
                          controller.selectedImage3.value!,
                          fit: BoxFit.cover,
                          width: 180.w,
                          height: 120.w,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
