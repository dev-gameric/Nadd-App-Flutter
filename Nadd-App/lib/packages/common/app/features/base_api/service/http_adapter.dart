import 'package:http/http.dart' as http;

import '../model/http_client_interface.dart';
import '../model/response_model.dart';

class HttpAdapter implements HttpClientInterface {
  @override
  Future<ResponseModel> get(String url,
      {Map<String, String>? queryParameters}) async {
    final response =
        await http.get(Uri.parse(url), headers: _getHeaders(queryParameters));
    return ResponseModel.fromHttp(response);
  }

  @override
  Future<ResponseModel> delete(String url,
      {Map<String, String>? queryParameters}) async {
    final response =
        await http.post(Uri.parse(url), headers: _getHeaders(queryParameters));
    return ResponseModel.fromHttp(response);
  }

  @override
  Future<ResponseModel> post(String url,
      {Map<String, dynamic>? data,
      Map<String, String>? queryParameters}) async {
    final response = await http.post(Uri.parse(url),
        body: data, headers: _getHeaders(queryParameters));
    return ResponseModel.fromHttp(response);
  }

  @override
  Future<ResponseModel> put(String url,
      {Map<String, dynamic>? data,
      Map<String, String>? queryParameters}) async {
    final response = await http.put(Uri.parse(url),
        body: data, headers: _getHeaders(queryParameters));

    return ResponseModel.fromHttp(response);
  }

  Map<String, String> _getHeaders(
    Map<String, String>? headers,
  ) {
    String? accessToken;
    headers ??= {};
    // ignore: unnecessary_null_comparison
    if (accessToken != null) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    headers['Authorization'] = 'No Auth';

    return headers;
  }
}
