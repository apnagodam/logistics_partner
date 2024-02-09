import 'dart:convert';

import 'package:ag_logistics_partner/Domain/providers/dio/dio_provider.dart';
import 'package:ag_logistics_partner/Domain/repo/authenctication/authentication_repo.dart';

class AuthenticationRepoImpl extends AuthenticationRepo{
  @override
  Future<Map<String, dynamic>> sendOtp({required int phoneNumber}) async {
    var response =
        await DioInstance().initDio().post('api/apna_send_otp', queryParameters: {
      'number': phoneNumber,
      'app_type': 'LP',
    });
    return jsonDecode(response.data);
  }

  @override
  Future<Map<String, dynamic>> verifyOtp({required String otp, required String phoneNumber}) async{
    var response = await DioInstance().initDio()
        .post('api/apna_verify_otp', queryParameters: {
      'number': phoneNumber,
      'otp': otp,
    });
    return response.data;
  }


}