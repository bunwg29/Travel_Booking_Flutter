import 'package:book_tour/presentation/SignUpScreen/controller/ControllerSignUp.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class Bindingsignup extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controllersignup>(() => Controllersignup());
  }
}
