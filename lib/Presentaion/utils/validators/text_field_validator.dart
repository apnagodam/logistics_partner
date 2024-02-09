import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enums/enums.dart';

class TextFieldValidator extends StateNotifier<TextFieldStatus> {
  TextFieldValidator() : super(TextFieldStatus.EMPTY);

  setValue(TextFieldStatus status) {
    state = status;
  }

  TextFieldStatus getState() => state;
}

var textFieldProvider = StateProvider((ref) => TextFieldValidator());
