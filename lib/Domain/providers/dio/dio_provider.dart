import 'package:ag_logistics_partner/Presentaion/utils/validators/strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../Presentaion/utils/shared_pref/shared_pref_provider.dart';

part 'dio_provider.g.dart';

Dio dio() {
  Dio initDio() => Dio(BaseOptions(
      baseUrl: 'https://apnagodam.com/test/',
      headers: {'Authorization': SharedPref().getToken()}))
    ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  return initDio();
}

var dioProvider = StateProvider((ref) => dio());

@riverpod
Dio dioInstance(DioInstanceRef ref) {
  return Dio(BaseOptions(
      baseUrl: LOCAL_BASE_URL,
      headers: {'Authorization': SharedPref().getToken()}))
    ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
}
