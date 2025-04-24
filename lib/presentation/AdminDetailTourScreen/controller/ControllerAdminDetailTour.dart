import 'package:book_tour/core/BaseWidget/DialogCustom.dart';
import 'package:book_tour/core/Enum/EnumType.dart';
import 'package:book_tour/data/repository/RepositoryAdminDetailTour.dart';
import 'package:book_tour/model/TourModel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class Controlleradmindetailtour extends GetxController {
  Repositoryadmindetailtour repositoryadmindetailtour =
      GetIt.I<Repositoryadmindetailtour>();
  final tour = (Get.arguments as TourModel).obs;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final isLoading = false.obs;
  Enumtype? enumtype;

  @override
  void onInit() {
    titleController.text = tour.value.name!;
    descriptionController.text = tour.value.description!;
    priceController.text = tour.value.price!.toString();
    enumtype = enumFromString(tour.value.type!);
    super.onInit();
  }

  void clickSave(BuildContext context) async {
    isLoading.value = true;
    tour.value.name = titleController.text;
    tour.value.description = descriptionController.text;
    tour.value.price = int.parse(priceController.text);
    tour.value.type = enumtype!.name;
    await repositoryadmindetailtour.fixTour(
      data: tour.value,
      success: (tour) {
        titleController.text = tour.name!;
        descriptionController.text = tour.description!;
        priceController.text = tour.price!.toString();
        enumtype = enumFromString(tour.type!);
        Dialogcustom.show(
          context,
          "Update sucess",
        );
      },
      erorr: () => Dialogcustom.show(context, "Loi", isSuccess: false),
    );
    isLoading.value = false;
  }

  void clickDelete(BuildContext context) async {
    isLoading.value = true;
    await repositoryadmindetailtour.deleteToru(
        idTour: tour.value.id!,
        success: () => Dialogcustom.show(context, "Delete Success"),
        erorr: () => Dialogcustom.show(context, "Delete Error"));
    isLoading.value = false;
  }
}
