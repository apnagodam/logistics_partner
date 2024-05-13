import 'dart:async';


import 'package:ag_logistics_partner/Domain/Rest/data/services/location/location_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../Presentaion/utils/enums/enums.dart';
import '../../../../../Presentaion/utils/validators/login_session_validator.dart';
import '../../../../../Data/models/current_orders_model.dart';
import '../../../../providers/dio/dio_provider.dart';

part 'running_orders_service.g.dart';

@Riverpod(keepAlive: true)
class RunningOrdersService extends _$RunningOrdersService {
  @override
  FutureOr<CurrentOrdersModel> build() {
    return getCurrentorders();
  }

  Future<CurrentOrdersModel> getCurrentorders() async {
    var response = await ref
        .read(dioProvider)
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
