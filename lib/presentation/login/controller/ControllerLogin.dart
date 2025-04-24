import 'package:book_tour/config/routes/appRoutes.dart';
import 'package:book_tour/core/BaseWidget/DialogCustom.dart';
import 'package:book_tour/core/Enum/EnumRole.dart';
import 'package:book_tour/core/util/JwtUtil.dart';
import 'package:book_tour/data/repository/RepositoryAuth.dart';
import 'package:book_tour/model/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class Controllerlogin extends GetxController {
  Repositoryauth repositoryauth = GetIt.I<Repositoryauth>();

  final email = TextEditingController();
  final password = TextEditingController();
  final isLoading = false.obs;

  void clickLogin(BuildContext context) async {
    isLoading.value = true;
    final user = UserModel(email: email.text, password: password.text);
    await repositoryauth.login(
      user: user,
      success: (data) {
        List<String> roles = Jwtutil.getRoles(data["token"]);
        if (roles.contains(Enumrole.CUSTOMER.name)) {
          Get.toNamed(AppRoutes.userIndex);
        } else if (roles.contains(Enumrole.ADMIN.name)) {
          Get.toNamed(AppRoutes.adminHome);
        }
      },
      error: (message) => Dialogcustom.show(context, message, isSuccess: false),
    );
    isLoading.value = false;
  }
}
