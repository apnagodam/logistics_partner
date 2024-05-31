import 'dart:convert';

import '../../models/ag_authentication_model.dart';


Future<AgAuthenticationModel> verifyOtp() {
  return Future(() => agAuthenticationModelFromMap(jsonEncode('')));
}
