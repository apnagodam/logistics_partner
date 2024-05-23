import 'package:ag_logistics_partner/Presentaion/ui/home/transporter/enquiries/enquiry_screen.dart';
import 'package:ag_logistics_partner/Presentaion/ui/home/transporter/home/transporter_home_page.dart';
import 'package:ag_logistics_partner/Presentaion/ui/home/transporter/profile/transporter_profile_screen.dart';
import 'package:ag_logistics_partner/Presentaion/ui/home/transporter/wallet_screen.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_helper_utils/flutter_helper_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/constants/color_constants.dart';

var currencyFormat =
    NumberFormat.currency(locale: 'HI', symbol: '\u{20B9}', decimalDigits: 2);
var bottomIndex = StateProvider((ref) => 0);

var listOfHomeScreens = [
  TransporterHomePage(),
  EnquiryScreen(),
  WalletScreen(),
  TransporterProfileScreen()
];

class TransporterHomeScreen extends ConsumerWidget {
  const TransporterHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [
          EneftyIcons.home_2_outline,
          EneftyIcons.card_add_outline,
          EneftyIcons.wallet_2_outline,
          EneftyIcons.profile_circle_outline
        ],
        activeIndex: ref.watch(bottomIndex),
        gapLocation: GapLocation.center,
        blurEffect: true,
        notchSmoothness: NotchSmoothness.defaultEdge,
        leftCornerRadius: 32,
        backgroundColor: ColorConstants.primaryColorDriver,
        activeColor: Colors.white,
        borderColor: Colors.white,
        rightCornerRadius: 32,
        onTap: (index) => ref.watch(bottomIndex.notifier).state = index,
        //other params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstants.primaryColorDriver,
        onPressed: () {},
        child: Icon(
          EneftyIcons.call_bold,
          color: Colors.white,
        ),
      ),
      body: Container(
        height: context.heightPx,
        width: context.widthPx,
        child: listOfHomeScreens[ref.watch(bottomIndex)],
      ),
    );
  }
}
