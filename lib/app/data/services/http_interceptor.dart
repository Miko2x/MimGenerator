import 'package:dio/dio.dart';
import 'package:mim_generator/app/data/providers/api.dart';

class HttpInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    Map<String, dynamic> headers = options.headers;
    if (headers.containsKey('customUrl')) {
      options.baseUrl = headers['customUrl'];
      options.headers.remove("customUrl");
    } else {
      options.baseUrl = Api.baseUrl;
    }
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) async {
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    return super.onError(err, handler);
  }
}