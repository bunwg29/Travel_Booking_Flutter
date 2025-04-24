import 'package:book_tour/core/BaseWidget/DialogCustom.dart';
import 'package:book_tour/core/util/izi_validate.dart';
import 'package:book_tour/data/repository/RepositorySignUp.dart';
import 'package:book_tour/model/CustomerModel.dart';
import 'package:book_tour/model/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class Controllersignup extends GetxController {
  Repositorysignup repositorysignup = GetIt.I<Repositorysignup>();

  final isLoading = false.obs;

  final username = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final pass1 = TextEditingController();
  void signUp(BuildContext context) async {
    bool check = isValidate(context);
    if (check) {
      isLoading.value = true;
      final user = UserModel(email: email.text, password: pass1.text);

      final customer =
          CustomerModel(phone: phone.text, user: user, username: username.text);
      await repositorysignup.signUp(
        data: customer,
        success: () => Dialogcustom.show(context, "Tạo tài khoản thành công"),
        error: (e) => Dialogcustom.show(context, e, isSuccess: false),
      );
      isLoading.value = false;
    }
  }

  bool isValidate(BuildContext context) {
    if (IZIValidate.nullOrEmpty(username.text.trim())) {
      Dialogcustom.show(context, "Tên không được trống", isSuccess: false);
      return false;
    }
    if (IZIValidate.nullOrEmpty(email.text.trim())) {
      Dialogcustom.show(context, "Email không được trống", isSuccess: false);
      return false;
    }

    if (IZIValidate.nullOrEmpty(pass1.text.trim())) {
      Dialogcustom.show(context, "Password không được trống", isSuccess: false);
      return false;
    }

    if (IZIValidate.nullOrEmpty(phone.text.trim())) {
      Dialogcustom.show(context, "Password không được trống", isSuccess: false);
      return false;
    }

    return true;
  }
}
