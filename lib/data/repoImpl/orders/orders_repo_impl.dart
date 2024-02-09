import 'package:ag_logistics_partner/Domain/providers/dio/dio_provider.dart';
import 'package:ag_logistics_partner/Domain/repo/orders/orders_repo.dart';
import 'package:ag_logistics_partner/data/models/current_orders_model.dart';

class OrdersRepoImpl extends OrdersRepo
{
  @override
  Future<CurrentOrdersModel> getCurrentorders() async {
    var response = await DioInstance().initDio()
        .get('lp_api/apna_lp_all_current_bookings', queryParameters: {
      'limit': 10,
    });
    return CurrentOrdersModel.fromMap(response.data);
  }

}