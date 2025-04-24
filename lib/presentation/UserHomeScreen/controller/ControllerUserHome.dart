import 'package:book_tour/data/repository/RepositoryHome.dart';
import 'package:book_tour/model/TourModel.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class Controlleruserhome extends GetxController {
  Repositoryhome repositoryhome = GetIt.I<Repositoryhome>();
  final isLoading = false.obs;
  final tours = <TourModel>[].obs;

  @override
  void onInit() async {
    await getAllTour();
    super.onInit();
  }

  Future<void> getAllTour() async {
    isLoading.value = true;
    List<TourModel> datas = await repositoryhome.getAllTour();
    tours.clear();
    tours.addAll(datas);
    isLoading.value = false;
  }
}
