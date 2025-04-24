
import 'package:book_tour/core/BaseWidget/CacheImgCustom.dart';
import 'package:book_tour/core/Enum/EnumStatusBook.dart';
import 'package:book_tour/model/BookTourModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class BoxBookTour extends StatelessWidget {
  final Booktourmodel bookTour;
  final Function() event;
  const BoxBookTour({super.key, required this.bookTour, required this.event});

  String formatDate(int? timestamp) {
    if (timestamp == null) return '';
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateFormat('dd/MM/yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.w),
      padding: EdgeInsets.all(14.w),
      height: 170.h,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(20.r))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset("assets/icon/icon4.png"),
                  SizedBox(
                    width: 6.w,
                  ),
                  Text(
                    formatDate(bookTour.dateStart),
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: bookTour.status == Enumstatusbook.WAIT.name
                            ? Colors.amber
                            : bookTour.status == Enumstatusbook.COMFIRMED.name
                                ? Colors.green
                                : Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(7.r))),
                    padding:
                        EdgeInsets.symmetric(vertical: 6.w, horizontal: 12.w),
                    child: Text("${bookTour.status}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300)),
                  ),
                ],
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: double.infinity,
                      width: 100.w,
                      child: CacheImgCustom(url: bookTour.tour!.imgs!.first),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(bookTour.tour!.name!,
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w500)),
                        Text("${bookTour.tour!.price!}pax",
                            style: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.w300)),
                        Text("${bookTour.totalMoney!}\$",
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w500))
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                      height: 30.h,
                      child: ElevatedButton(
                          onPressed: () => event(),
                          child: Text(
                            "View",
                            style: TextStyle(
                                fontSize: 9.sp, fontWeight: FontWeight.w500),
                          ))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
