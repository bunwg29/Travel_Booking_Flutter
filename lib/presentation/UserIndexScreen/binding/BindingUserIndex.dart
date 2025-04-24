import 'package:book_tour/presentation/UserBookingScreen/controller/ControllerUserBooking.dart';
import 'package:book_tour/presentation/UserHomeScreen/controller/ControllerUserHome.dart';
import 'package:book_tour/presentation/UserProfileScreen/controller/ControllerUserProfile.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class Bindinguserindex extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controlleruserhome>(() => Controlleruserhome());
    Get.lazyPut<Controlleruserbooking>(() => Controlleruserbooking());
    Get.lazyPut<Controlleruserprofile>(() => Controlleruserprofile());
  }
}
