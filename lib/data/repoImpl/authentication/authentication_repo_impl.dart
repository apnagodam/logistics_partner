import 'dart:convert';

import 'package:ag_logistics_partner/Data/models/otp_response_model.dart';
import 'package:ag_logistics_partner/Domain/providers/dio/dio_provider.dart';
import 'package:ag_logistics_partner/Domain/repo/authenctication/authentication_repo.dart';

import '../../models/auth_model.dart';

class AuthenticationRepoImpl extends AuthenticationRepo {
  @override
  Future<OtpResponseModel> sendOtp({required int phoneNumber}) async {
    var response =
        await DioInstance().post('api/apna_send_otp', queryParameters: {
      'number': phoneNumber,
      'app_type': 'LP',
    });
    return OtpResponseModel.fromMap(jsonDecode(response.data));
  }

  @override
  Future<AuthenticationModel> verifyOtp(
      {required String otp, required String phoneNumber}) async {
    var response =
        await DioInstance().post('api/apna_verify_otp', queryParameters: {
      'number': phoneNumber,
      'otp': otp,
    });
    return authenticationModelFromMap(jsonEncode(response.data));
  }
}
