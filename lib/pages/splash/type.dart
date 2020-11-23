import 'package:flutter/widgets.dart';
class BottomNavType {
  BottomNavType({this.title, this.icon});
  final String title;
  final IconData icon;
}

class BaseBodyType<T> {
  BaseBodyType({this.success = false, this.message = '', this.data, this.code = '',});
  final bool success;
  final String message;
  final T data;
  final String code;

  factory BaseBodyType.fromJson(Map<String, dynamic> json) => BaseBodyType<T>(
    success: json["success"],
    code: json["code"],
    message: json["message"],
    data: (T as dynamic).fromJson(json["data"]),
  );
  Map<String, dynamic> toJson() => {
    "success": success,
    "code": code,
    "message": message,
    "data": (data as dynamic).toJson(),
  };
}
