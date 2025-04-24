import 'package:book_tour/config/routes/appRoutes.dart';
import 'package:book_tour/presentation/AdminAddTourScreen/binding/BindingAdminAddTour.dart';
import 'package:book_tour/presentation/AdminAddTourScreen/view/AdminAddTourScreen.dart';
import 'package:book_tour/presentation/AdminDetailBookedScreen/binding/BindingAdminDetailBooked.dart';
import 'package:book_tour/presentation/AdminDetailBookedScreen/view/AdminDetailBookedScreen.dart';
import 'package:book_tour/presentation/AdminDetailTourScreen/binding/BindingAdminDetailTour.dart';
import 'package:book_tour/presentation/AdminDetailTourScreen/view/AdminDetailTourScreen.dart';
import 'package:book_tour/presentation/AdminHomeScreen/binding/BindingAdminHome.dart';
import 'package:book_tour/presentation/AdminHomeScreen/view/AdminHomeScreen.dart';
import 'package:book_tour/presentation/DetailProfileScreen/binding/BindingDetailProfile.dart';
import 'package:book_tour/presentation/DetailProfileScreen/view/DetailProfileScreen.dart';
import 'package:book_tour/presentation/IntroduceScreen/view/IntroduceScreen.dart';
import 'package:book_tour/presentation/SignUpScreen/binding/BindingSignUp.dart';
import 'package:book_tour/presentation/SignUpScreen/view/SignUpScreen.dart';
import 'package:book_tour/presentation/UserDetailBookedScreen/binding/BindingUserDetailBooked.dart';
import 'package:book_tour/presentation/UserDetailBookedScreen/view/UserDetailBookedScreen.dart';
import 'package:book_tour/presentation/UserDetailTourScreen/binding/BindingUserDetailTour.dart';
import 'package:book_tour/presentation/UserDetailTourScreen/view/UserDetailTour.dart';
import 'package:book_tour/presentation/UserIndexScreen/binding/BindingUserIndex.dart';
import 'package:book_tour/presentation/UserIndexScreen/view/UserIndexScreen.dart';
import 'package:book_tour/presentation/UserSearchScreen/binding/BindingUserSearch.dart';
import 'package:book_tour/presentation/UserSearchScreen/view/UserSearchScreen.dart';
import 'package:book_tour/presentation/login/binding/BindingController.dart';
import 'package:book_tour/presentation/login/view/LoginScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.introduce,
      page: () => const Introducescreen(),
    ),
    GetPage(
        name: AppRoutes.login,
        page: () => const Loginscreen(),
        binding: Loginbinding()),
    GetPage(
        name: AppRoutes.signUp,
        page: () => const Signupscreen(),
        binding: Bindingsignup()),
    GetPage(
        name: AppRoutes.userIndex,
        page: () => const Userindexscreen(),
        binding: Bindinguserindex()),
    GetPage(
        name: AppRoutes.userDetaiTour,
        page: () => const UserDetailTourScreen(),
        binding: Bindinguserdetailtour()),
    GetPage(
        name: AppRoutes.detailProfile,
        page: () => const Detailprofilescreen(),
        binding: Bindingdetailprofile()),
    GetPage(
        name: AppRoutes.adminHome,
        page: () => const AdminHomeScreen(),
        binding: Bindingadminhome()),
    GetPage(
        name: AppRoutes.adminAddTour,
        page: () => const Adminaddtourscreen(),
        binding: Bindingadminaddtour()),
    GetPage(
        name: AppRoutes.adminDetailTour,
        page: () => const Admindetailtourscreen(),
        binding: Bindingadmindetailtour()),
    GetPage(
        name: AppRoutes.userDetailBooked,
        page: () => const Userdetailbookedscreen(),
        binding: Bindinguserdetailbooked()),
    GetPage(
        name: AppRoutes.adminDetailBooked,
        page: () => const Admindetailbookedscreen(),
        binding: Bindingadmindetailbooked()),
    GetPage(
        name: AppRoutes.search,
        page: () => const Usersearchscreen(),
        binding: Bindingusersearch()),
  ];
}
