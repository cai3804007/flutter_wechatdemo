import 'package:dio/dio.dart';

enum HttpMethod { get, post }

class HttpManager {
  static Dio _dioInstance = Dio();

  static Dio _getDioInstance() {
    return _dioInstance ??= Dio();
  }

  static Future<Response> getData(String url,
      {Map<String, dynamic>? queryParameters}) async {
    return _sendRequest(HttpMethod.get, url, queryParameters: queryParameters);
  }

  static Future<Response> postData(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) {
    return _sendRequest(HttpMethod.post, url,
        data: data, queryParameters: queryParameters);
  }

  static Future<Response> _sendRequest(HttpMethod method, String url,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    switch (method) {
      case HttpMethod.get:
        return await _getDioInstance()
            .get(url, queryParameters: queryParameters);
      case HttpMethod.post:
        return await _getDioInstance()
            .post(url, data: data, queryParameters: queryParameters);
      default:
        throw Future.error('网络请求错误');
    }
  }
}
