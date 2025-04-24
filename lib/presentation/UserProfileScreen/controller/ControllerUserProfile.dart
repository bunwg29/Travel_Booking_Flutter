import 'package:book_tour/data/repository/RepositoryUserProfile.dart';
import 'package:book_tour/model/CustomerModel.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class Controlleruserprofile extends GetxController {
  Repositoryuserprofile repositoryuserprofile =
      GetIt.I<Repositoryuserprofile>();
  final cutomer = Rx<CustomerModel?>(null);
  final isLoading = false.obs;

  @override
  void onInit() {
    getMe();
    super.onInit();
  }

  void getMe() async {
    isLoading.value = true;
    cutomer.value = await repositoryuserprofile.getMe();
    isLoading.value = false;
  }
}
