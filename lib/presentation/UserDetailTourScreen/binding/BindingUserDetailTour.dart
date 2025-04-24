import 'package:book_tour/presentation/UserDetailTourScreen/controller/ControllerUserDetailTour.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class Bindinguserdetailtour extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controlleruserdetailtour>(() => Controlleruserdetailtour());
  }
}
