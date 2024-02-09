import 'dart:async';
import 'dart:convert';


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../data/models/commodity_calculation_model.dart';
import '../../../../../../data/models/commodity_calculation_response_model.dart';
import '../../../../../providers/dio/dio_provider.dart';
import 'commodity_calculation_notifier.dart';


class CommodityCalculationService extends AutoDisposeFamilyAsyncNotifier<CommodityCalculationResponseModel, CommodityCalculationModel> {

  Future<CommodityCalculationResponseModel> calculateData() async {
    var response = await ref
        .watch(dioProvider)
        .initDio()
        .post('lp_api/calculate-qv', data: arg.toJson());
    ref.watch(commodityCalculationProvider).setModel(CommodityCalculationResponseModel.fromJson(response.data));
    return CommodityCalculationResponseModel.fromMap(response.data);
  }


  @override
  FutureOr<CommodityCalculationResponseModel> build(
      CommodityCalculationModel arg) {
    return calculateData();
  }
}
