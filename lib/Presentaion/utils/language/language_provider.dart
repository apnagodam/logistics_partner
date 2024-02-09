import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enums/enums.dart';

class LanguageState extends StateNotifier<LANG> {
  LanguageState() : super(LANG.english);

  setLanguageState(LANG lng) => state = lng;

  LANG getSelectedLanguage() => state;
}

var languageProvider = StateProvider((ref) => LanguageState());
