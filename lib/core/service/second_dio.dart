import 'dart:io';
import 'dart:isolate';

import 'package:dio/dio.dart';

import '../../Pages/search_page/search_model.dart';

abstract class IService {
  final Dio _dio;

  IService(this._dio);

  Future<List<Exercises>?> fetcExerciseItem();
}

class Service extends IService {
  Service(super.dio);

  @override
  Future<List<Exercises>?> fetcExerciseItem() async {
    final response = await _dio.get('/v1/exercises');

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is List) {
        return jsonBody.map((e) => Exercises.fromJson(e)).toList();
      }
    }
    return null;
  }
}
