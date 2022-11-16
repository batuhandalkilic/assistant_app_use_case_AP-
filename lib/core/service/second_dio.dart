import 'dart:io';
import 'dart:isolate';

import 'package:dio/dio.dart';

import '../../Pages/search_page/search_model.dart';

abstract class IService {
  final Dio dio;
  final String path;

  IService({required this.dio, required this.path});

  Future<List<Exercises>?> fetcExerciseItem();
}

class Service extends IService {
  Service({required super.dio, required super.path});

  @override
  Future<List<Exercises>?> fetcExerciseItem() async {
    final response = await dio.get(path);

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is List) {
        return jsonBody.map((e) => Exercises.fromJson(e)).toList();
      }
    }
    return null;
  }
}
