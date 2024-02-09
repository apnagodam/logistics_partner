abstract class AuthenticationRepo{
  Future<Map<String,dynamic>> sendOtp({required int phoneNumber});
  Future<Map<String,dynamic>> verifyOtp({required String otp, required String phoneNumber});
}