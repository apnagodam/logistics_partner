import 'package:ag_logistics_partner/Presentaion/ui/home/WSP/profile/wsp_profile_screen.dart';
import 'package:ag_logistics_partner/Presentaion/ui/home/WSP/wsp_home_page.dart';
import 'package:ag_logistics_partner/Presentaion/utils/constants/color_constants.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_helper_utils/flutter_helper_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

var currencyFormat =
    NumberFormat.currency(locale: 'HI', symbol: '\u{20B9}', decimalDigits: 2);
var bottomIndex = StateProvider((ref) => 0);

var listOfHomeScreens = [WspHomePage(), WspProfileScreen()];

class WSPHomeScreen extends ConsumerWidget {
  const WSPHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(

      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [EneftyIcons.home_2_outline, EneftyIcons.profile_circle_outline],
        activeIndex: ref.watch(bottomIndex),
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        leftCornerRadius: 32,
        activeColor: ColorConstants.secondaryColorWSP,
        borderColor: ColorConstants.primaryColorWSP,
        rightCornerRadius: 32,
        onTap: (index) => ref.watch(bottomIndex.notifier).state = index,
        //other params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstants.secondaryColorWSP,
        onPressed: () {},
        child: Icon(EneftyIcons.call_bold,color: ColorConstants.primaryColorWSP,),
      ),
      body: Container(
        height: context.heightPx,
        width: context.widthPx,
        child: listOfHomeScreens[ref.watch(bottomIndex)],
      ),
    );
  }
}
