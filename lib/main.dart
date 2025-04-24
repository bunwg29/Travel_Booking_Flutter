import 'package:book_tour/config/routes/AppPages.dart';
import 'package:book_tour/config/routes/appRoutes.dart';
import 'package:book_tour/config/theme/AppTheme.dart';
import 'package:book_tour/core/di_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      builder: (context, child) => GetMaterialApp(
          title: 'Travel Booking',
          initialRoute: AppRoutes.introduce,
          debugShowCheckedModeBanner: false,
          getPages: AppPages.pages,
          theme: AppTheme.lightTheme),
    );
  }
}
