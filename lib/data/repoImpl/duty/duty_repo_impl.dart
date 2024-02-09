import 'package:ag_logistics_partner/Domain/providers/dio/dio_provider.dart';
import 'package:ag_logistics_partner/Domain/repo/duty/duty_repo.dart';

class DutyRepoImpl extends DutyRepo {
  @override
  Future<Map<String, dynamic>> getLpDutyStatus({required int status}) async {
    var response = await DioInstance()
        .initDio()
        .post('lp_api/apna_lp_online_offline', queryParameters: {
      'online_offline': status,
    });

    return response.data;
  }

  @override
  Future<Map<String, dynamic>> getAutoAcceptStatus(int status) async {
    var response = await DioInstance()
        .initDio()
        .post('lp_api/apna_lp_auto_accept', queryParameters: {
      'auto_accept': status,
    });
    return response.data;
  }
}
