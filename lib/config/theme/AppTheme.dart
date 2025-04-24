import 'package:book_tour/core/extensions/ExtentionString.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: "Roboto",
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.r))),
            foregroundColor: Colors.white,
            backgroundColor: Colors.black)),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 18.sp, fontWeight: FontWeight.w500, color: Colors.white)),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      hintStyle: TextStyle(
        fontSize: 11.sp,
        fontWeight: FontWeight.w300,
        color: "#808089".toColor(),
      ),
      labelStyle: TextStyle(fontSize: 12.sp, color: Colors.black),
      prefixIconColor: Colors.black,
      fillColor: Colors.white,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        borderSide: BorderSide(
          color: "#959595".toColor(),
          width: 1.0,
        ),
      ),
    ),
    textTheme: TextTheme(
      titleSmall: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
      titleLarge: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w500),
      labelSmall: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedIconTheme: IconThemeData(
        color: Colors.white,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.black,
      ),
      selectedLabelStyle: TextStyle(
          fontSize: 10, fontWeight: FontWeight.w600, color: Colors.white),
      unselectedLabelStyle: TextStyle(
          fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black),
    ),
  );

  static final ThemeData darkTheme = ThemeData();
}
