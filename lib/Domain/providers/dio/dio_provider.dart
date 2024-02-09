import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Presentaion/utils/shared_pref/shared_pref_provider.dart';

class DioInstance extends StateNotifier<Dio> {

  DioInstance({this.ref}) : super(Dio()) {
    initDio();
  }

  final StateProviderRef? ref;



  Dio initDio() => state = Dio(BaseOptions(
      baseUrl: 'https://apnagodam.com/test/',
      headers: {'Authorization': "\$2y\$10\$4/qBvVZ7X1X2ortbFd8TLuG4770XCB8eBQjwKybtino/7YHU3F38W"}))
    ..interceptors.add(addInterceptors());

  addInterceptors() => InterceptorsWrapper(onResponse: (response, handler) {
        Logger().w(response.data.toString());
        return handler.next(response);
      }, onError: (error, handler) {
        Logger().e(error.message);
        return handler.next(error);
      }, onRequest: (request, handler) {
        Logger().f(request.headers.toString());
        Logger().d(request.baseUrl.toString() + request.path.toString());
        Logger().f(request.data.toString());
        return handler.next(request);
      });

  updateDio(Map<String, dynamic> headers) {
    state.options.headers.addAll(headers);
  }
}

var dioProvider = StateProvider((ref) => DioInstance(ref: ref));
