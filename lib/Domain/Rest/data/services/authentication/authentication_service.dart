import 'dart:async';
import 'dart:convert';


import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../Presentaion/utils/shared_pref/shared_pref_provider.dart';
import '../../../../providers/dio/dio_provider.dart';
import '../location/location_service.dart';

part 'authentication_service.g.dart';

@riverpod
class AuthenticationService extends _$AuthenticationService {
  @override
  FutureOr<Map<String, dynamic>> build(int arg) {
    return sendOtp();
  }

  Future<Map<String, dynamic>> sendOtp() async {
    var response =
        await ref.read(dioProvider).initDio().post('api/apna_send_otp', queryParameters: {
      'number': arg,
      'app_type': 'LP',
    });

    return jsonDecode(response.data);
  }

  Future<Map<String, dynamic>> verifyOtp(String otp, String token) async {
    var response = await ref
        .read(dioProvider).initDio()
        .post('api/apna_verify_otp', queryParameters: {
      'number': arg,
      'lat': ref.watch(latProvider.notifier).state,
      'long': ref.watch(latProvider.notifier).state,
      'otp': otp,
    });

    return response.data;
  }

  Future<void> logoutUser() async {
    ref.invalidate(dioProvider);
    await ref.watch(sharedPrefProvider).sharedPreferences.clear();
  }
}
