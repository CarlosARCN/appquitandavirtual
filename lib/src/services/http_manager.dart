import 'package:dio/dio.dart';

abstract class HttpMethods {
  static const String post = '';
  static const String get = '';
  static const String put = '';
  static const String patch = '';
  static const String delete = '';
}

class HttpManager {
  Future<Map> restRequest({
    required String url,
    required method,
    Map? headers,
    Map? body,
  }) async {
    //headers da requisicao
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json',
        'X-Parse-Application-Id': 'g1Oui3JqxnY4S1ykpQWHwEKGOe0dRYCPvPF4iykc',
        'X-Parse-REST-API-Key': 'rFBKU8tk0m5ZlKES2CGieOaoYz6TgKxVMv8jRIsN',
      });

    Dio dio = Dio();

    try {
      Response response = await dio.request(
        url,
        options: Options(
          headers: defaultHeaders,
          method: method,
        ),
        data: body,
      );

      //retorno do resultado do backend
      return response.data;
    } on DioError catch (error) {
      //retorno do erro do dio request
      return error.response?.data ?? {};
    } catch (error) {
      //retorno de map vazio para erro generalizado

      return {};
    }
  }
}
