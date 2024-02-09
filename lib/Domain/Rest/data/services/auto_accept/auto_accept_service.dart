import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../providers/dio/dio_provider.dart';
import '../location/location_service.dart';
part 'auto_accept_service.g.dart';

@Riverpod(keepAlive: true)
class AutoAcceptService extends _$AutoAcceptService {

  @override
  FutureOr<Map<String, dynamic>> build(int arg) {
    return getAutoAcceptStatus();
  }

  Future<Map<String, dynamic>> getAutoAcceptStatus() async {
    var response = await ref
        .watch(dioProvider).initDio()
        .post('lp_api/apna_lp_auto_accept', queryParameters: {
      'auto_accept': arg,
      'lat': ref.watch(latProvider.notifier).state,
      'long': ref.watch(latProvider.notifier).state,
    });
    return response.data;
  }
}
