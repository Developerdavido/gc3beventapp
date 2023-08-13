import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:gc3bapp/config/env.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/services/dialog_service.dart';
import 'package:gc3bapp/services/local_storage_service.dart';

class HttpService{
  String? host;

  BaseOptions? baseOptions;
  Dio? dio;
  final dialog = locator<DialogService>();
  int connectTimeout = 60000;
  int receiveTimeout = 60000;

  Future<Map<String, String>> getHeaders() async {
    return {
      HttpHeaders.acceptHeader: "application/json",
      //"access-token": "${await getAuthBearerToken()}",
      //"mobile-mode": APiEnvironment.mobileMode!
    } ;

  }

  HttpService() {
    initHttpService();
  }


  //get the remote config
  Future<void> initHttpService() async {
    host = APiEnvironment.baseUrl;
    log(host!);
    //initialize dio
    baseOptions = BaseOptions(
        baseUrl: host!,
        connectTimeout: const Duration(seconds: 120),
        receiveTimeout: const Duration(seconds: 120),
        validateStatus: (status) {
          return status! <= 500;
        }

    );
    dio  = Dio(baseOptions);
  }


  //get user token from login details
  final localStorage = locator<LocalStorageService>();


  //TODO: this is to get the bearer token for the app to maintain session
  // Future<String?> getAuthBearerToken() async {
  //   var authDetails = await localStorage.readModel(
  //     StorageConstants.authModalKey,
  //   );
  //   return authDetails == null ? null : AuthModal.fromJson(authDetails).token;
  // }


  //get method
  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters, CancelToken? token}) async {
    String uri = "$host$url";
    print(uri);
    return dio!.get(
      uri,
      options: Options(
        headers: await getHeaders(),
      ),
      queryParameters: queryParameters,
    );
  }

  //get no user
  Future<Response> getNoAuth(String url,
      {Map<String, dynamic>? queryParameters, CancelToken? token}) async {
    String uri = "$host$url";
    print(uri);
    return dio!.get(
      uri,
      options: Options(
          headers: {
            HttpHeaders.acceptHeader: "application/json",
          }
      ),
      queryParameters: queryParameters,
    );
  }

  //post method
  Future<Response> post(String url, body, {CancelToken? token}) async {
    String uri = "$host$url";
    print(uri);
    return dio!.post(
      uri,
      data: body,
      cancelToken: token,
      options: Options(
        headers: await getHeaders(),
      ),
    );
  }



  //patch from database
  Future<Response> patch(String url, body, {CancelToken? token}) async {
    String uri = "$host$url";
    print(uri);
    return dio!.patch(
      uri,
      data: body,
      options: Options(
        headers: await getHeaders(),
      ),
    );
  }

  // put into database
  Future<Response> put (String url, {Map<String, dynamic>? queryParameters, dynamic body,  CancelToken? token}) async {
    String uri = "$host$url";
    print(uri);
    return dio!.put(
        uri,
        data: body,
        options: Options(
          headers: await getHeaders(),
        ),
        queryParameters: queryParameters
    );
  }

  //detele from database
  Future<Response> delete(String url, {dynamic body, CancelToken? token}) async {
    String uri = "$host$url";
    print(uri);
    return dio!.delete(
      uri,
      data: body,
      options: Options(
        headers: await getHeaders(),
      ),
    );
  }



}