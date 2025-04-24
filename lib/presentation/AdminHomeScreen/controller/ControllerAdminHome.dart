import 'package:book_tour/data/repository/RepositoryAdminHome.dart';
import 'package:book_tour/model/BookTourModel.dart';
import 'package:book_tour/model/TourModel.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class Controlleradminhome extends GetxController {
  Repositoryadminhome repositoryadminhome = GetIt.I<Repositoryadminhome>();

  final page = 0.obs;
  final isLoading = false.obs;
  final tours = <TourModel>[];
  final bookeds = <Booktourmodel>[];

  @override
  void onInit() async {
    await getAllTour();
    await getAllBookedTour();
    super.onInit();
  }

  Future<void> getAllTour() async {
    isLoading.value = true;
    tours.clear();
    tours.addAll(await repositoryadminhome.getAllTour());
    print(tours.length);
    print(tours);
    isLoading.value = false;
  }

  Future<void> getAllBookedTour() async {
    isLoading.value = true;
    bookeds.clear();
    bookeds.addAll(await repositoryadminhome.getAllBookedTour());
    isLoading.value = false;
  }
}
