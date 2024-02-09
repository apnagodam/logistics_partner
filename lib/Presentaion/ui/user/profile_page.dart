// ignore_for_file: prefer_interpolation_to_compose_strings


import 'package:flutter/material.dart';
import 'package:flutter_helper_utils/flutter_helper_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../utils/shared_pref/shared_pref_provider.dart';
import '../../utils/validators/strings.dart';
import '../../utils/widgets/widgets.dart';

class Profilepage extends ConsumerWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userData = ref.watch(sharedPrefProvider).getUserData();
    var user = userData.userDetails;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent.withOpacity(0.0),
        forceMaterialTransparency: true,
        title: const Text('Profile'),
      ),
      body: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: context.themeData.primaryColor),
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(IMAGE_BASE_URL +
                          (userData.userDetails?.imagePath ?? "") +
                          "/" +
                          (userData.userDetails?.passportImage ?? "")),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "L.P. Power :- ${userData.userDetails?.lpPower ?? "0"}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: context.themeData.primaryColor),
                  ),
                ),
              ),
              Divider(
                endIndent: 10,
                indent: 10,
              ),
              profileItem(translate('name'), userData.userDetails?.name ?? "",
                  LineAwesome.user),
              profileItem(
                  translate('pancard_number'),
                  userData.userDetails?.pancardNo ?? "",
                  LineAwesome.id_card_alt_solid),
              profileItem(
                  translate('account_number'),
                  userData.userDetails?.accountNo ?? "",
                  LineAwesome.balance_scale_left_solid),
              profileItem(
                  translate('aadhar_number_error'),
                  '${userData.userDetails?.aadharNo ?? "N/A"}',
                  LineAwesome.id_badge),
              Visibility(
                  child: profileItem(
                      translate('vehcile_number'),
                      userData.userDetails?.drivingLicenceNo ?? "N/A",
                      LineAwesome.truck_moving_solid)),
              Visibility(
                  child: profileItem(
                      translate('vehcile'),
                      userData.userDetails?.vehicleType ?? "N/A",
                      LineAwesome.truck_solid)),
              Visibility(
                  child: profileItem(
                      translate('Vehcile_min_capictiy'),
                      userData.userDetails?.vehicleCapMin ?? "N/A",
                      LineAwesome.level_down_alt_solid)),
              Visibility(
                  child: profileItem(
                      translate('Vehcile_max_capictiy'),
                      userData.userDetails?.vehicleCapMax ?? "N/A",
                      LineAwesome.level_up_alt_solid))
            ],
          )),
    );
  }
}
