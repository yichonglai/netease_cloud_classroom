import 'dart:convert';

class BaseBody {
  BaseBody({this.success = false, this.message = '', this.data, this.code = '',});
  final bool success;
  final String message;
  final dynamic data;
  final String code;

  factory BaseBody.fromJson(Map<String, dynamic> json) => BaseBody(
    success: json["success"],
    code: json["code"],
    message: json["message"],
    data: json["data"],
  );
  Map<String, dynamic> toJson() => {
    "success": success,
    "code": code,
    "message": message,
    "data": data,
  };
}
