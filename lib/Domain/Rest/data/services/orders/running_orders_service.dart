import 'dart:async';


import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../Presentaion/utils/enums/enums.dart';
import '../../../../../Presentaion/utils/validators/login_session_validator.dart';
import '../../../../../data/models/current_orders_model.dart';
import '../../../../providers/dio/dio_provider.dart';
import '../location/location_service.dart';

part 'running_orders_service.g.dart';

@Riverpod(keepAlive: true)
class RunningOrdersService extends _$RunningOrdersService {
  @override
  FutureOr<CurrentOrdersModel> build() {
    return getCurrentorders();
  }

  Future<CurrentOrdersModel> getCurrentorders() async {
    var response = await ref
        .read(dioProvider).initDio()
        .get('lp_api/apna_lp_all_current_bookings', queryParameters: {
      'limit': 10,
      'lat': ref.watch(latProvider.notifier).state,
      'long': ref.watch(latProvider.notifier).state,
    });

    print(response.requestOptions.queryParameters.toString());
    if (response.data['status'] == 3) {
      ref.watch(sessionValidatorProvider).setStatus(LoginStatus.LOGGED_OUT);
    }
    return CurrentOrdersModel.fromMap(response.data);
  }
}
