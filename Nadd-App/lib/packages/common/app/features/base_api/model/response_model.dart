

import 'dart:convert';

class ResponseModel {
  dynamic data;
  int statusCode;
  ResponseModel({
    this.data,
    required this.statusCode,
  });
  

  factory ResponseModel.fromDio(dynamic response) {
    return ResponseModel(
      data: response.data != null ? response.data as Map<String, dynamic> : null,
      statusCode: response.statusCode as int,
    );
  }
  factory ResponseModel.fromHttp(dynamic response) {
    return ResponseModel(
      data: response.body != null ?  jsonDecode(response.body) : null,
      statusCode: response.statusCode as int,
    );
  }

}
