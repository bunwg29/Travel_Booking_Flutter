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
      bottomNavigationBar: Container(
        color: Colors.blue,
        height: 85.h,
        child: BottomNavigationBar(
          backgroundColor: Colors.blue,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            _pageController.jumpToPage(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
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
    );
  }
}
