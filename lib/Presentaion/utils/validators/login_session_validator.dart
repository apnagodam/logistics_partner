import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enums/enums.dart';

class SessionValidator extends StateNotifier<LoginStatus> {
  SessionValidator() : super(LoginStatus.DEFAULT);

  setStatus(LoginStatus status) => state = status;
  getStatus() => state;
}

var sessionValidatorProvider = StateProvider((ref) => SessionValidator());
