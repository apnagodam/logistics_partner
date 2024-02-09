import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../Presentaion/utils/enums/enums.dart';

class AuthenticationState extends StateNotifier<OtpStatus> {
  AuthenticationState() : super(OtpStatus.DEFAULT);
  setOtpStatus(OtpStatus status) => state = status;
  OtpStatus getOtpStatus() => state;
}

var otpStatusProvider = StateNotifierProvider((ref) => AuthenticationState());
