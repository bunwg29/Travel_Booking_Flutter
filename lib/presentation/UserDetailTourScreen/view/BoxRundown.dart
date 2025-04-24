import 'package:book_tour/model/TourModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoxRundown extends StatelessWidget {
  final TourModel tourModel;
  const BoxRundown({super.key, required this.tourModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Rundown",
          style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 16.h,
        ),
        ListView.builder(
            itemCount: tourModel.activitySchedules!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${index + 1}. ",
                          style: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.w900),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tourModel.activitySchedules![index].title!,
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(tourModel
                                  .activitySchedules![index].description!)
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ))
      ],
    );
  }
}
