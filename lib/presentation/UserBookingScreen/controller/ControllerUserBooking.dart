import 'package:book_tour/data/repository/RepositoryUserBooked.dart';
import 'package:book_tour/model/BookTourModel.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class Controlleruserbooking extends GetxController {
  Repositoryuserbooked repositoryuserbookede = GetIt.I<Repositoryuserbooked>();
  final isLoading = false.obs;
  final bookeds = <Booktourmodel>[].obs;

  @override
  void onInit() async {
    getAllBooked();
    super.onInit();
  }

  void getAllBooked() async {
    isLoading.value = true;
    bookeds.clear();
    bookeds.addAll(await repositoryuserbookede.getAllBooked());
    isLoading.value = false;
  }
}
