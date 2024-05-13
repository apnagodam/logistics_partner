import '../../../Data/models/auth_model.dart';
import '../../../Data/models/otp_response_model.dart';

abstract class AuthenticationRepo {
  Future<OtpResponseModel> sendOtp({required int phoneNumber});

  Future<AuthenticationModel> verifyOtp(
      {required String otp, required String phoneNumber});
}
