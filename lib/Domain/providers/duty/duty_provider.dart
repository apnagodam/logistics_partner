import 'package:ag_logistics_partner/Data/repoImpl/duty/duty_repo_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var dutyStatusProvider = Provider((ref) => DutyRepoImpl());


var dutyOnOffProvider = FutureProvider.family((ref,int status) => ref.watch(dutyStatusProvider).getAutoAcceptStatus(status));

var autoAcceptStatusProvider = FutureProvider.family((ref,int status) => ref.watch(dutyStatusProvider).getLpDutyStatus(status: status));