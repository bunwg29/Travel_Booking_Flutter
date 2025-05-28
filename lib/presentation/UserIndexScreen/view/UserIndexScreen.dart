import 'package:book_tour/presentation/UserBookingScreen/view/UserBookingScreen.dart';
import 'package:book_tour/presentation/UserHomeScreen/view/UserHomeScreen.dart';
import 'package:book_tour/presentation/UserProfileScreen/view/UserProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Userindexscreen extends StatefulWidget {
  const Userindexscreen({super.key});

  @override
  State<Userindexscreen> createState() => _UserindexscreenState();
}

class _UserindexscreenState extends State<Userindexscreen> {
  late PageController _pageController;
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const Userhomescreen(),
    const Userbookingscreen(),
    const Userprofilescreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black87,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
                _pageController.jumpToPage(index);
              },
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey[400],
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Booking',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
