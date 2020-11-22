import 'package:flutter/material.dart';

class BaseBodyType<T> {
  BaseBodyType({this.success = false, this.message = '', this.data, this.code = '',});
  final bool success;
  final String message;
  final T data;
  final String code;
}
