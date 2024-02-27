
import 'response_model.dart';

abstract class HttpClientInterface {
  Future<ResponseModel> get(String url, {Map<String, String>? queryParameters});
  Future<ResponseModel> post(String url,{Map<String, dynamic>? data, Map<String, String>? queryParameters} );
  Future<ResponseModel> put(String url, {Map<String, dynamic>? data, Map<String, String>? queryParameters});
    Future<ResponseModel> delete(String url, {Map<String, String>? queryParameters});
}
