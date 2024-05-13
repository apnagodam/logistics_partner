import 'package:ag_logistics_partner/Domain/repo/orders/orders_repo.dart';
import 'package:ag_logistics_partner/Data/repoImpl/orders/orders_repo_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var ordersProvider = Provider((ref) => OrdersRepoImpl());

var currentOrdersProvider =
    FutureProvider((ref) => ref.watch(ordersProvider).getCurrentorders());
