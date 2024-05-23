import 'package:ag_logistics_partner/Presentaion/utils/constants/style_constants.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_helper_utils/flutter_helper_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../utils/constants/color_constants.dart';

class TransporterProfileScreen extends ConsumerWidget {
  const TransporterProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title:  Text(
            "Profile",
            style: StyleConstants.titleStyle(),
          ),
          centerTitle: true,
        ),
        body: Container(
          margin: const Pad(all: 10),
          padding: const Pad(all: 10),
          height: context.heightPx,
          width: context.widthPx,
          child: ListView(
            children: [
              CircleAvatar(
                radius: Adaptive.h(8),
                backgroundColor: Colors.grey.withOpacity(0.1),
                child: const Icon(Icons.person),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "edit Profile",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: Adaptive.sp(17)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: "Santu Ram Driver",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: Adaptive.sp(16)),
                decoration: InputDecoration(
                    enabled: false,
                    prefixIcon: const Icon(EneftyIcons.user_octagon_outline),
                    contentPadding: const EdgeInsets.only(left: 10),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: ColorConstants.primaryColorDriver)),
                    border: const OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: "9001157788",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: Adaptive.sp(16)),
                decoration: InputDecoration(
                    enabled: false,
                    prefixIcon: const Icon(EneftyIcons.call_outline),
                    contentPadding: const EdgeInsets.only(left: 10),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: ColorConstants.primaryColorDriver)),
                    border: const OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: "driver@apnagodam.com",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: Adaptive.sp(16)),
                decoration: InputDecoration(
                    enabled: false,
                    prefixIcon: const Icon(Icons.email_outlined),
                    contentPadding: const EdgeInsets.only(left: 10),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: ColorConstants.primaryColorDriver)),
                    border: const OutlineInputBorder()),
              )
            ],
          ),
        ));
  }
}
