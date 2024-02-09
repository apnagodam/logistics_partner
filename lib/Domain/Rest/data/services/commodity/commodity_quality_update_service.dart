import 'dart:async';


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../data/models/commodity_update_model.dart';
import '../../../../providers/dio/dio_provider.dart';

class CommodityQualityUpdateService extends AutoDisposeFamilyAsyncNotifier<Map<String,dynamic>,QualityUpdateModel> {
  @override
  FutureOr<Map<String, dynamic>> build(QualityUpdateModel arg) {
    return lpQualityUpdate();
  }

  Future<Map<String, dynamic>> lpQualityUpdate() async {
    var response = await ref
        .watch(dioProvider).initDio()
        .post('lp_api/apna_lp_quality_update', data: arg.toJson());

    return response.data;
  }
}
