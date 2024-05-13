import 'dart:async';


import 'package:ag_logistics_partner/Domain/Rest/data/services/location/location_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../Data/models/all_orders_model.dart';
import '../../../../providers/dio/dio_provider.dart';

part 'all_orders_service.g.dart';

@riverpod
class AllOrdersService extends _$AllOrdersService {
  @override
  FutureOr<List<Order>> build() {
    return getAllOrders();
  }

  Future<List<Order>> getAllOrders() async {
    var response = await ref
        .watch(dioProvider)
        .get('lp_api/apna_lp_all_bookings', queryParameters: {
      'limit': 10,
      'lat': ref.watch(latProvider.notifier).state,
      'long': ref.watch(latProvider.notifier).state,
    });

    return AllOrdersModel.fromMap(response.data).orders ?? [];
  }
}
