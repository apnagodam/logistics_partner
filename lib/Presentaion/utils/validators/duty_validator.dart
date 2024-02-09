import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enums/enums.dart';

class DutyValidator extends StateNotifier<ONDUTY> {
  DutyValidator() : super(ONDUTY.OFF);

  setStatus(ONDUTY status) => state = status;
  ONDUTY getStatus() => state;
}

var dutyValidatorProvider = StateProvider((ref) => DutyValidator());
