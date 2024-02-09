import 'package:ag_logistics_partner/data/models/commodity_update_model.dart';

import '../../../data/models/commodity_calculation_model.dart';
import '../../../data/models/commodity_calculation_response_model.dart';
import '../../../data/models/commodity_type_model.dart';

abstract class CommodityRepo {
  Future<Category> getCommodityPrameters({required id});

  Future<CommodityCalculationResponseModel> calculateParameters(
      {required CommodityCalculationModel commodityCalculationModel});

  Future<Map<String, dynamic>> lpQualityUpdate({required QualityUpdateModel qualityUpdateModel});
}
