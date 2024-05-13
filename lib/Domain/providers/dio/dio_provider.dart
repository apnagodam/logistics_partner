import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Presentaion/utils/shared_pref/shared_pref_provider.dart';

Dio DioInstance() {
  Dio initDio() =>
      Dio(BaseOptions(
          baseUrl: 'https://apnagodam.com/test/',
          headers: {'Authorization': SharedPref().getToken()}))
        ..interceptors.add(
            LogInterceptor(requestBody: true, responseBody: true));
  return initDio();
}

var dioProvider = StateProvider((ref) => DioInstance());
