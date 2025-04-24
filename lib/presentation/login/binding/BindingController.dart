import 'package:book_tour/presentation/login/controller/ControllerLogin.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class Loginbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controllerlogin>(() => Controllerlogin());
  }
}
