import 'dart:convert';

import 'package:ag_logistics_partner/Data/models/otp_response_model.dart';
import 'package:ag_logistics_partner/Domain/providers/dio/dio_provider.dart';
import 'package:ag_logistics_partner/Domain/repo/authenctication/authentication_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/auth_model.dart';
part 'authentication_repo_impl.g.dart';

class AuthenticationRepoImpl {}

@riverpod
Future<OtpResponseModel> sendOtp(SendOtpRef ref,{required int phoneNumber}) async {
  var response = await dio().post('api/apna_send_otp', queryParameters: {
    'number': phoneNumber,
    'app_type': 'LP',
  });
  return OtpResponseModel.fromMap(jsonDecode(response.data));
}

@riverpod
Future<AuthenticationModel> verifyOtp(
    VerifyOtpRef ref,
    {required String otp, required String phoneNumber}) async {
  var response = await dio().post('api/apna_verify_otp', queryParameters: {
    'number': phoneNumber,
    'otp': otp,
  });
  return authenticationModelFromMap(jsonEncode(response.data));
}
