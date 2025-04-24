import 'package:book_tour/presentation/AdminHomeScreen/controller/ControllerAdminHome.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class Bindingadminhome extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controlleradminhome>(() => Controlleradminhome());
  }
}
