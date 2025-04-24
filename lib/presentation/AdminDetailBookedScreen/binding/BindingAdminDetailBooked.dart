import 'package:book_tour/presentation/AdminDetailBookedScreen/controller/ControllerAdminDetailBooked.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class Bindingadmindetailbooked extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controlleradmindetailbooked>(
        () => Controlleradmindetailbooked());
  }
}
