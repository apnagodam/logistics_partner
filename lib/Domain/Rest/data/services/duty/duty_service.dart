
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../Presentaion/ui/home/home_page.dart';
import '../../../../../Presentaion/utils/widgets/widgets.dart';
import '../../../../providers/dio/dio_provider.dart';
import '../auto_accept/auto_accept_notifier.dart';

part 'duty_service.g.dart';

@riverpod
class DutyService extends _$DutyService {
  Future<Map<String, dynamic>> getLpDutyStatus() async {

    var response =
        await ref.read(dioProvider).initDio().post('lp_api/apna_lp_online_offline', queryParameters: {
      'online_offline': arg,
    });

    if (response.data['online_offline'].toString() == '0') {
      ref.watch(dutyProvider.notifier).state = false;
    } else {
      ref.watch(dutyProvider.notifier).state = true;
    }
    successToast(response.data['message'].toString());
    return response.data;
  }

  Future<Map<String, dynamic>> getAutoAcceptStatus(int status) async {

    var response =
        await ref.watch(dioProvider).initDio().post('lp_api/apna_lp_auto_accept', queryParameters: {
      'auto_accept': status,
    });

    if (status == 1) {
      ref.watch(autoAcceptProvider).setStatus(true);
    } else {
      ref.watch(autoAcceptProvider).setStatus(false);
    }
    return response.data;
  }

  @override
  FutureOr<Map<String, dynamic>> build(int arg) {
    return getLpDutyStatus();
  }
}
