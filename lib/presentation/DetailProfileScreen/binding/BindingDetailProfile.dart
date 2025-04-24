import 'package:book_tour/presentation/DetailProfileScreen/controller/ControllerDetailScreen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class Bindingdetailprofile extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controllerdetailprofilescreen>(
        () => Controllerdetailprofilescreen());
  }
}
