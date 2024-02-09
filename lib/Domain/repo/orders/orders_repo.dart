import '../../../Data/models/current_orders_model.dart';

abstract class OrdersRepo{
  Future<CurrentOrdersModel> getCurrentorders();
}