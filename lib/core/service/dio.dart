import 'package:assistant_app_use_case/core/Api/api_keys.dart';
import 'package:dio/dio.dart';

class Service {
  static final Service _instance = Service._init();
  static Service get instance => _instance;
  Service._init();
  final Dio _dio = Dio();

  void onInit() {
    var headers = {
      // 'Accept':"application/json"
      'X-RapidAPI-Key': ApiKeys.instance.rapidApiExercisesKey,
      'X-RapidAPI-Host': 'exercises-by-api-ninjas.p.rapidapi.com'
    };

    _dio.options = BaseOptions(
      baseUrl: 'https://exercises-by-api-ninjas.p.rapidapi.com/',
      headers: headers,
      sendTimeout: 50000,
      receiveTimeout: 5000,
      connectTimeout: 5000,
    );

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) => handler.next(options),
      onResponse: (e, handler) {
        if (!(e.data is Map || e.data is List)) {
          e.data = null;
        }
        return handler.next(e);
      },
      onError: (e, handler) {
        if (e.response != null) {
          switch (e.response!.statusCode) {
            case 500:
              print('Error Server');
              break;
            default:
          }
        }
      },
    ));
  }
}
