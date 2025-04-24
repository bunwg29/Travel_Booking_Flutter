import 'package:book_tour/presentation/UserSearchScreen/controller/ControllerUserSearch.dart';
import 'package:get/get.dart';

class Bindingusersearch extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controllerusersearch>(() => Controllerusersearch());
  }
}
