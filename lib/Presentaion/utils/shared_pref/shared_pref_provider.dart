import 'dart:convert';


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/auth_model.dart';
import '../validators/strings.dart';

class SharedPref {
  SharedPref(this.sharedPreferences) : super();

  final SharedPreferences sharedPreferences;

  //language
  setLanguage(String language) =>
      sharedPreferences.setString(languageKey, language);

  String getLanguage() => sharedPreferences.getString(languageKey) ?? 'en';

  //authentication
  setToken(String token) => sharedPreferences.setString(authTokenKey, token);

  String getToken() => sharedPreferences.getString(authTokenKey) ?? "";

  //login data
  setUserData(Map<String, dynamic> model) => sharedPreferences.setString(
      userDataKey, jsonEncode(AuthenticationModel.fromMap(model).toJson()));

  AuthenticationModel getUserData() => AuthenticationModel.fromJson(
      jsonDecode(sharedPreferences.getString(userDataKey) ?? ""));
}

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

var sharedPrefProvider = Provider((ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  return SharedPref(sharedPrefs);
});