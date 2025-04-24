import 'package:book_tour/config/routes/appRoutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Introducescreen extends StatefulWidget {
  const Introducescreen({super.key});

  @override
  State<Introducescreen> createState() => _IntroducescreenState();
}

class _IntroducescreenState extends State<Introducescreen> {
  PageController pageController = PageController();

  int current = 0;
  void next() {
    if (current < 2) {
      current++;
      pageController.animateToPage(
        current,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {});
    } else {
      Get.toNamed(AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Image.asset("assets/img/intro1.png"),
                Image.asset("assets/img/intro2.png"),
                Image.asset("assets/img/intro3.png")
              ],
            )),
            Container(
              width: double.infinity,
              height: 470.h,
              padding: EdgeInsets.symmetric(horizontal: 47.h, vertical: 30.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.r),
                      topRight: Radius.circular(50.r))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    current == 0
                        ? "Plan Your Trip"
                        : current == 1
                            ? "Get the Best Deal"
                            : "Explore Local Attractions",
                    style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: "roboto"),
                  ),
                  SizedBox(
                    height: 44.h,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    current == 0
                        ? "Create your dream trip with ease. Choose a destination, find the perfect place to stay, and create an itinerary that suits your preferences."
                        : current == 1
                            ? "Save time and money by finding the best travel deals. We provide a range of exclusive promotions and discounts to make your trip more affordable."
                            : "Discover the beauty of local places you may never have visited. Experience local life and enjoy authentic experiences in each destination.",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                      height: 60.h,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => next(),
                          child: Text(current == 2 ? "Finish" : "Next"))),
                  SizedBox(
                    height: 34.h,
                  ),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    axisDirection: Axis.horizontal,
                    effect: const SlideEffect(
                        spacing: 10.0,
                        radius: 16,
                        dotWidth: 12.0,
                        dotHeight: 12.0,
                        paintStyle: PaintingStyle.stroke,
                        strokeWidth: 1.5,
                        dotColor: Colors.grey,
                        activeDotColor: Colors.black),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
