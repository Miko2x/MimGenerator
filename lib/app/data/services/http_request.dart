import 'package:dio/dio.dart';
import 'package:mim_generator/app/data/providers/api.dart';
import 'package:mim_generator/app/data/services/http_interceptor.dart';

class HttpRequest {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: Api.baseUrl
    )
  );
  
  HttpRequest() {
    dio.interceptors.add(HttpInterceptor());
  }
}