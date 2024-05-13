import 'dart:async';
import 'dart:convert';

import 'package:ag_logistics_partner/Domain/Rest/data/services/location/location_service.dart';
import 'package:ag_logistics_partner/Domain/providers/dio/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../Presentaion/utils/shared_pref/shared_pref_provider.dart';

part 'authentication_service.g.dart';

@riverpod
class AuthenticationService extends _$AuthenticationService {
  @override
  FutureOr<Map<String, dynamic>> build(int arg) {
    return sendOtp();
  }

  Future<Map<String, dynamic>> sendOtp() async {
    var response =
        await DioInstance().post('api/apna_send_otp', queryParameters: {
      'number': arg,
      'app_type': 'LP',
    });

    return jsonDecode(response.data);
  }

  Future<Map<String, dynamic>> verifyOtp(String otp, String token) async {
    var response = await ref
        .read(dioProvider)
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
    await SharedPref.clear();
  }
}
