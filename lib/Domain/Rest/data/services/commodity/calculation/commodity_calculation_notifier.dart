import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../data/models/commodity_calculation_response_model.dart';

class CommodityCalculationNotifer extends StateNotifier<CommodityCalculationResponseModel>{

  CommodityCalculationNotifer():super(CommodityCalculationResponseModel());

  setModel(CommodityCalculationResponseModel response)=> state=response;
  getModel()=>state;

}

var commodityCalculationProvider = StateProvider((ref,) => CommodityCalculationNotifer());
