import 'package:assistant_app_use_case/Pages/search_page/search_model.dart';
import 'package:assistant_app_use_case/Pages/search_page/search_view.dart';
import 'package:assistant_app_use_case/core/base/base_state.dart';
import 'package:dio/dio.dart';

import '../../core/Api/api_keys.dart';
import '../../core/service/second_dio.dart';

abstract class SearchViewModel extends BaseModel<SearchPage> {
  late final IService service;
  List<Exercises> exerciseList = [];
  List<Exercises>? searcList;

  @override
  void initState() {
    service = Service(Dio(BaseOptions(
        headers: {'X-RapidAPI-Key': ApiKeys.instance.rapidApiExercisesKey, 'X-RapidAPI-Host': 'exercises-by-api-ninjas.p.rapidapi.com'},
        baseUrl: "https://exercises-by-api-ninjas.p.rapidapi.com")));
    super.initState();
    fetcItems();
    setState(() {});
  }

  Future<void> fetcItems() async {
    var axax = await service.fetcExerciseItem();
    exerciseList = axax ?? [];
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
}
