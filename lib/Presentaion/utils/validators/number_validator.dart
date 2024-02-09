import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enums/enums.dart';

class MobileNumberValidator extends StateNotifier<NumberValidation> {
  MobileNumberValidator() : super(NumberValidation.DEFAULT);

  setStatus(NumberValidation validation) => state = validation;

  NumberValidation getStatus() => state;
}

var numberValidationProvider = StateProvider((ref) => MobileNumberValidator());
