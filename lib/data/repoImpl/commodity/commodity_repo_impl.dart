import 'package:ag_logistics_partner/Domain/providers/dio/dio_provider.dart';
import 'package:ag_logistics_partner/Domain/repo/commodity/commodity_repo.dart';
import 'package:ag_logistics_partner/Data/models/commodity_calculation_model.dart';
import 'package:ag_logistics_partner/Data/models/commodity_calculation_response_model.dart';
import 'package:ag_logistics_partner/Data/models/commodity_type_model.dart';
import 'package:ag_logistics_partner/Data/models/commodity_update_model.dart';

class CommodityRepoImpl extends CommodityRepo{

  @override
  Future<Category> getCommodityPrameters({required id}) async{
    var response = await dio().get("");
    return CommodityTypeModel.fromMap(response.data).categories![0] ;
  }

  @override
  Future<CommodityCalculationResponseModel> calculateParameters({required CommodityCalculationModel commodityCalculationModel})async
  {
    var response = await dio().post('lp_api/calculate-qv',data: commodityCalculationModel);
    return CommodityCalculationResponseModel.fromMap(response.data);
  }

  @override
  Future<Map<String, dynamic>> lpQualityUpdate({required QualityUpdateModel qualityUpdateModel}) async{
   var response = await dio().post('lp_api/apna_lp_quality_update',data: qualityUpdateModel);
   return response.data;
  }
}