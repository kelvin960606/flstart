import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApiService extends GetxService {
  static const String apiEndpoint = '';
  static const bool debug = false;

  Dio dio = new Dio(new BaseOptions(
    baseUrl: apiEndpoint,
    contentType: 'application/json',
    connectTimeout: 60000,
  ));

  void init() {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      if (debug) {
        print("\n================== 请求数据 ==========================");
        print("url = ${options.uri.toString()}");
        print("headers = ${options.headers}");
        print("params = ${options.data}");
        if ((options.data.toString().contains('FormData'))) {
          options.data.fields.forEach((element) {
            print('${element.key} : ${element.value}');
          });
        }
      }
    }, onResponse: (response) async {
      if (debug) {
        print("\n================== 响应数据 ==========================");
        print("code = ${response.request.uri}");
        print("code = ${response.statusCode}");
        print("data = ${response.data}");
        print("\n");
      }

      return response;
    }, onError: (DioError e) async {
      if (debug) {
        print("\n================== 错误响应数据 ======================");
        print("type = ${e.type}");
        print("message = ${e.message}");
        print("stackTrace = ${e.error}");
        print("\n");
      }

      return e;
    }));
  }

  Future apiRequest(
      String path, String type, dynamic data, String baseUrl) async {
    var response;
    if (baseUrl != null) {
      dio.options.baseUrl = baseUrl;
    } else {
      dio.options.baseUrl = apiEndpoint;
    }
    if (type == 'get' || type == null) {
      response = await dio.get(path);
    } else if (type == 'post') {
      response = await dio.post(path, data: data);
    } else if (type == 'put') {
      response = await dio.put(path, data: data);
    } else if (type == 'delete') {
      response = await dio.delete(path, data: data);
    }
    return response;
  }
}
