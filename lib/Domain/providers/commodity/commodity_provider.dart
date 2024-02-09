import 'package:ag_logistics_partner/data/models/commodity_calculation_model.dart';
import 'package:ag_logistics_partner/data/repoImpl/commodity/commodity_repo_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/commodity_update_model.dart';

var commodityProvider = Provider((ref) => CommodityRepoImpl());
var commodityParametersProvider = FutureProvider.family(
    (ref, int id) => ref.read(commodityProvider).getCommodityPrameters(id: id));
var commodityCalculationProvider = FutureProvider.family(
    (ref, CommodityCalculationModel commodityCalculationModel) => ref
        .read(commodityProvider)
        .calculateParameters(
            commodityCalculationModel: commodityCalculationModel));
var commodityQualityUpdateProvider = FutureProvider.family(
    (ref, QualityUpdateModel qualityUpdateModel) => ref
        .read(commodityProvider)
        .lpQualityUpdate(qualityUpdateModel: qualityUpdateModel));
