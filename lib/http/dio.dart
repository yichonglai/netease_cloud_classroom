import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:connectivity/connectivity.dart';
import './http_error.dart';
import './type.dart';

typedef void SuccessCallback<BaseBody>(BaseBody body);
typedef void FailureCallback(HttpError error);
const String _BASE_URL = 'http://localhost:3001/api';
const int _CONNECT_TIMEOUT = 5000;
const int _RECEIVE_TIMEOUT = 5000;

/// Dio封装
class Http {
  Dio _dio;
  Dio get dio => _dio;

  /// 同一个CancelToken可以用于多个请求，当一个CancelToken取消时，所有使用该CancelToken的请求都会被取消，一般情况下，一个页面对应一个CancelToken。
  Map<String, CancelToken> _cancelTokens = Map<String, CancelToken>();
  Http._internal() {
    _initDio();
  }
  static final Http _singleton = Http._internal();
  factory Http() => _singleton;

  /// 初始化Dio实例
  _initDio() {
    if (_dio != null) return;
    _dio = Dio(
      BaseOptions(
        baseUrl: _BASE_URL,
        connectTimeout: _CONNECT_TIMEOUT,
        receiveTimeout: _RECEIVE_TIMEOUT,
        headers: {
          HttpHeaders.userAgentHeader: 'dio',
        },
      ),
    );
    _dio.interceptors
      ..add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options) async {
            // 在请求被发送之前做一些事情
            return options; //continue
            // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
            // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
            //
            // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
            // 这样请求将被中止并触发异常，上层catchError会被调用。
          },
          onResponse: (Response response) async {
            // 在返回响应数据之前做一些预处理
            return response; // continue
          },
          onError: (DioError e) async {
            // 当请求失败时做一些预处理
            return e; //continue
          },
        ),
      )
      ..add(
        LogInterceptor(responseBody: false),
      );
  }

  /// ## 统一网络请求
  /// ### [url] : 网络请求地址
  /// ### [requestTag] : 请求统一标识(cancelToken)，用于取消网络请求
  /// ### [method] : 请求方法
  /// ### [data] : post等 请求参数
  /// ### [queryParameters] : query
  /// ### [options] : 请求配置
  /// ### [successCallback] : 请求成功回调
  /// ### [failureCallback] : 请求失败回调
  Future<BaseBody> _request({
    @required String url,
    String requestTag,
    String method,
    dynamic data,
    Map<String, dynamic> queryParameters,
    Options options,
    SuccessCallback<BaseBody> successCallback,
    FailureCallback failureCallback,
  }) async {
    HttpError error;
    if (!(await isNetworkConnected())) {
      error = HttpError(HttpError.NETWORK_ERROR, '网络异常，请稍后重试！');
      if (failureCallback != null) {
        failureCallback(error);
        return null;
      }
      throw error;
    }
    try {
      options?.method = method ?? 'GET';
      Response res = await _dio.request(
        url,
        data: data,
        queryParameters: queryParameters ?? {},
        cancelToken:
            requestTag == null ? null : generateCancelToken(requestTag),
        options: options ?? Options(method: method ?? 'GET'),
      );
      final BaseBody body = BaseBody.fromJson(res.data);
      if (body.success) {
        if (successCallback != null) {
          successCallback(body);
        }
        return body;
      } else {
        error = HttpError(body.code, body.message);
        //只能用 Future，外层有 try catch
        if (failureCallback != null) {
          failureCallback(error);
          return null;
        }
        return Future.error(error);
      }
    } on DioError catch (e) {
      error = HttpError.dioError(e);
      if (failureCallback != null) {
        failureCallback(error);
        return null;
      }
      print('DioError-error');
      print(e);
      throw error;
    } catch (e) {
      error = HttpError(HttpError.UNKNOWN, e.message?? '网络异常，请稍后重试！');
      if (failureCallback != null) {
        failureCallback(error);
        return null;
      }
      print('UNKNOWN-error');
      print(e);
      throw error;
    }
  }

  /// get请求
  Future<BaseBody> get({
    @required String url,
    String requestTag,
    dynamic data,
    Map<String, dynamic> queryParameters,
    Options options,
    SuccessCallback<BaseBody> successCallback,
    FailureCallback failureCallback,
  }) async {
    return _request(
      url: url,
      requestTag: requestTag,
      method: 'GET',
      data: data,
      queryParameters: queryParameters,
      options: options,
      successCallback: successCallback,
      failureCallback: failureCallback
    );
  }

  /// post请求
  Future<BaseBody> post({
    @required String url,
    String requestTag,
    dynamic data,
    Map<String, dynamic> queryParameters,
    Options options,
    SuccessCallback<BaseBody> successCallback,
    FailureCallback failureCallback,
  }) async {
    return _request(
        url: url,
        requestTag: requestTag,
        method: 'POST',
        data: data,
        queryParameters: queryParameters,
        options: options,
        successCallback: successCallback,
        failureCallback: failureCallback
    );
  }


  /// 检查网络状态
  Future<bool> isNetworkConnected() async {
    ConnectivityResult result = await Connectivity()
        .checkConnectivity()
        .catchError((e) => ConnectivityResult.none);
    return result != ConnectivityResult.none;
  }

  // 生成cancelToken
  CancelToken generateCancelToken(String requestTag) {
    final cancelToken = _cancelTokens[requestTag] == null
        ? CancelToken()
        : _cancelTokens[requestTag];
    _cancelTokens[requestTag] = cancelToken;
    return cancelToken;
  }
}
