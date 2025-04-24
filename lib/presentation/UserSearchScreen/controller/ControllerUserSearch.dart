import 'package:book_tour/data/repository/RepositorySearch.dart';
import 'package:book_tour/model/TourModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class Controllerusersearch extends GetxController {
  Repositorysearch repositorysearch = GetIt.I<Repositorysearch>();

  final searchController = TextEditingController();
  final searchText = ''.obs;
  final tours = <TourModel>[].obs;

  void clickSearch(String data) async {
    searchText.value = data;
    debounce<String>(
      searchText,
      (value) async {
        tours.value = (await repositorysearch.getAllTourSearch(value));
      },
      time: const Duration(milliseconds: 200),
    );
  }
}
