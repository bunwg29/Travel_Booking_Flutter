import 'package:book_tour/core/BaseWidget/CacheImgCustom.dart';
import 'package:book_tour/model/TourModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BoxTopDetailTour extends StatelessWidget {
  const BoxTopDetailTour({
    super.key,
    required this.tour,
  });

  final TourModel tour;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450.h,
      width: Get.width,
      child: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: PageView(
              children: [
                CacheImgCustom(url: tour.imgs![0]),
                CacheImgCustom(url: tour.imgs![1]),
                CacheImgCustom(url: tour.imgs![2]),
              ],
            ),
          ),
          Positioned(
            top: 20.h,
            left: 21.w,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                padding: const EdgeInsets.all(10),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.w),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.all(Radius.circular(10.r))),
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              height: 100,
              width: Get.width - 60.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tour.name!,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              "assets/icon/icon1.png",
                              color: Colors.white,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            tour.address!.province!,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "${tour.averageRate ?? 0}",
                        style: TextStyle(color: Colors.white, fontSize: 15.sp),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
