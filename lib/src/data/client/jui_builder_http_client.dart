import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class JuiBuilderHttpClient {
  Future<void> setup(String baseUrl);
  Future<Response> get(String path);
}

@Injectable(as: JuiBuilderHttpClient)
class JuiBulderHttpClientImpl implements JuiBuilderHttpClient {
  final Dio _dio;

  JuiBulderHttpClientImpl(this._dio);

  @override
  Future<void> setup(String baseUrl) async {
    _dio.options.baseUrl = baseUrl;
    _dio.interceptors.add(LogInterceptor());
  }

  @override
  Future<Response> get(String path) async {
    return _dio.get(path);
  }
}
