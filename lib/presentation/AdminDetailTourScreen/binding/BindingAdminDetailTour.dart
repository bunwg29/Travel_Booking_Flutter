import 'package:book_tour/presentation/AdminDetailTourScreen/controller/ControllerAdminDetailTour.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class Bindingadmindetailtour extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controlleradmindetailtour>(() => Controlleradmindetailtour());
  }
}
