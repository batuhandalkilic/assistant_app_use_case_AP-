import 'package:assistant_app_use_case/Pages/search_page/search_model.dart';
import 'package:assistant_app_use_case/Pages/search_page/search_view.dart';
import 'package:assistant_app_use_case/core/base/base_state.dart';
import 'package:dio/dio.dart';

import '../../core/Api/api_keys.dart';
import '../../core/service/service_dio.dart';

abstract class SearchViewModel extends BaseModel<SearchPage> {
  late final IService service;
  List<Exercises> exerciseList = [];
  List<Exercises>? searcList;
  bool isready = true; // Görsellik  yok. Search inince typing hazır

  @override
  void initState() {
    service = Service(
        path: '/v1/exercises',
        dio: Dio(BaseOptions(
            headers: {'X-RapidAPI-Key': ApiKeys.instance.rapidApiExercisesKey, 'X-RapidAPI-Host': 'exercises-by-api-ninjas.p.rapidapi.com'},
            baseUrl: "https://exercises-by-api-ninjas.p.rapidapi.com")));
    super.initState();
    fetcItems();
  }

  Future<void> fetcItems() async {
    isLoading();
    var result = await service.fetcExerciseItem();
    exerciseList = result ?? [];
    isLoading();
    // isready = true;
    setState(() {});
  }

  void search(String query) {
    searcList = exerciseList.where((element) {
      if (query.isNotEmpty) {
        if (element.muscle!.startsWith(query.toLowerCase()) || element.type!.startsWith(query.toLowerCase())) {
          return true;
        } else
          return false;
      } else
        return false;
    }).toList();
    setState(() {});
  }

  void clearSearchList() {
    searcList = [];
    setState(() {});
  }

// Görsellik  yok. Search inince typing hazır
  void isLoading() {
    isready = !isready;
  }
}
