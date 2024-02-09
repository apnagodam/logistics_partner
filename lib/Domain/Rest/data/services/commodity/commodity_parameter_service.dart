import 'dart:async';


import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../data/models/commodity_type_model.dart';
import '../../../../providers/dio/dio_provider.dart';
import '../location/location_service.dart';

part 'commodity_parameter_service.g.dart';

@riverpod
class CommodityParameterService extends _$CommodityParameterService {
  @override
  FutureOr<Category> build(int arg) {
    return getCommodityPrameters();
  }

  Future<Category> getCommodityPrameters() async {
    var response = await ref
        .watch(dioProvider).initDio()
        .get('api/commodity-parameter', queryParameters: {
      'id': arg,
      'lat': ref.watch(latProvider.notifier).state,
      'long': ref.watch(latProvider.notifier).state,
    });
    print(CommodityTypeModel.fromMap(response.data).categories.toString());
    return CommodityTypeModel.fromMap(response.data).categories!.first;
  }
}
