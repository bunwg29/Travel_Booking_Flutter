import 'package:book_tour/presentation/AdminAddTourScreen/controller/ControllerAdminAddTour.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class Bindingadminaddtour extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controlleradminaddtour>(() => Controlleradminaddtour());
  }
}
