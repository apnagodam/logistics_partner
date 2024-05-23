import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_helper_utils/flutter_helper_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../utils/constants/color_constants.dart';
import '../../../../utils/constants/style_constants.dart';
import '../../WSP/wsp_home_screen.dart';
import '../home/transporter_home_page.dart';

class AllEnquiriesScreen extends ConsumerWidget {
  const AllEnquiriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "All Enquiries",
          style: StyleConstants.titleStyle(),
        ),
      ),
      body: ColumnSuper(children: [
        SizedBox(height: context.heightPx,
        width: context.widthPx,child: ListView.builder(

              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) => SizedBox(
                width: context.widthPx,
                child: Card(
                  elevation: 10,
                  surfaceTintColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(
                          color: ColorConstants.primaryColorDriver)),
                  margin: Pad(all: Adaptive.sp(15)),
                  child: Padding(
                    padding: Pad(
                      all: 10,
                    ),
                    child: ColumnSuper(
                      alignment: Alignment.centerLeft,
                      children: [
                        Text(
                          "Date: ${currentDate}",
                          style: StyleConstants.normalStyle(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ColumnSuper(
                            alignment: Alignment.center,
                            children: [
                              Text(
                                "rj14-dw-0870-9001155788-kkbk0033",
                                style: TextStyle(
                                    fontSize: Adaptive.sp(16),
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(children: [
                                Expanded(
                                  child: Text(
                                    "Location:",
                                    style: TextStyle(
                                        fontSize: Adaptive.sp(16),
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),

                                Text(
                                  "Jaipur to Delhi",
                                  style: TextStyle(
                                      fontSize: Adaptive.sp(16),
                                      fontWeight: FontWeight.w700),
                                ),
                              ]),
                              Row(children: [
                                Expanded(
                                  child: Text(
                                    "Quantity",
                                    style: TextStyle(
                                        fontSize: Adaptive.sp(16),
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Text(
                                  "355 Qtl",
                                  style: TextStyle(
                                      fontSize: Adaptive.sp(16),
                                      fontWeight: FontWeight.w700),
                                ),
                              ]),
                              Row(children: [
                                Expanded(
                                  child: Text(
                                    "Freight rate: ",
                                    style: TextStyle(
                                        fontSize: Adaptive.sp(16),
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Text(
                                  "${currencyFormat.format(110)} per Qtl",
                                  style: TextStyle(
                                      fontSize: Adaptive.sp(16),
                                      fontWeight: FontWeight.w700),
                                ),
                              ]),
                              Row(children: [
                                Expanded(
                                  child: Text(
                                    "Advance Payment: ",
                                    style: TextStyle(
                                        fontSize: Adaptive.sp(16),
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Text(
                                  "${currencyFormat.format(20000)}",
                                  style: TextStyle(
                                      fontSize: Adaptive.sp(16),
                                      fontWeight: FontWeight.w700),
                                ),
                              ]),
                              Row(children: [
                                Expanded(
                                  child: Text(
                                    "Payment to: ",
                                    style: TextStyle(
                                        fontSize: Adaptive.sp(16),
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Text(
                                  "Transporter",
                                  style: TextStyle(
                                      fontSize: Adaptive.sp(16),
                                      fontWeight: FontWeight.w700),
                                ),
                              ]),
                              Row(children: [
                                Expanded(
                                  child: Text(
                                    "Trip Status: ",
                                    style: TextStyle(
                                        fontSize: Adaptive.sp(16),
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      showBarModalBottomSheet(
                                          context: context,
                                          builder: (context) =>
                                              enquiryStatus(context));
                                    },
                                    child: Text(
                                      "Trip Status: Started",
                                      style: TextStyle(
                                          decoration:
                                          TextDecoration.underline,
                                          fontSize: Adaptive.sp(16),
                                          color: ColorConstants
                                              .primaryColorDriver,
                                          fontWeight: FontWeight.w700),
                                    )),
                              ]),
                            ]),
                      ],
                    ),
                  ),
                ),
              )),),
      ],),
    );
  }
  enquiryStatus(BuildContext context) => Padding(
    padding: Pad(
        top: 10,
        right: 10,
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 10),
    child: ColumnSuper(
      alignment: Alignment.topLeft,
      children: [
        Text("Trip Status",
            style: TextStyle(
                fontSize: Adaptive.sp(22), fontWeight: FontWeight.w700)),
        Padding(
          padding: Pad(
            all: 10,
          ),
          child: ColumnSuper(
            alignment: Alignment.centerLeft,
            children: [
              SizedBox(
                height: 10,
              ),
              ColumnSuper(alignment: Alignment.center, children: [
                Text(
                  "rj14-dw-0870-9001155788-kkbk0033",
                  style: TextStyle(
                      fontSize: Adaptive.sp(16),
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Expanded(
                    child: Text(
                      "Location:",
                      style: TextStyle(
                          fontSize: Adaptive.sp(16),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    "Jaipur to Delhi",
                    style: TextStyle(
                        fontSize: Adaptive.sp(16),
                        fontWeight: FontWeight.w700),
                  ),
                ]),
                Row(children: [
                  Expanded(
                    child: Text(
                      "Quantity",
                      style: TextStyle(
                          fontSize: Adaptive.sp(16),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    "355 Qtl",
                    style: TextStyle(
                        fontSize: Adaptive.sp(16),
                        fontWeight: FontWeight.w700),
                  ),
                ]),
                Row(children: [
                  Expanded(
                    child: Text(
                      "Freight rate: ",
                      style: TextStyle(
                          fontSize: Adaptive.sp(16),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    "${currencyFormat.format(110)} per Qtl",
                    style: TextStyle(
                        fontSize: Adaptive.sp(16),
                        fontWeight: FontWeight.w700),
                  ),
                ]),
                Row(children: [
                  Expanded(
                    child: Text(
                      "Advance Payment: ",
                      style: TextStyle(
                          fontSize: Adaptive.sp(16),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    "${currencyFormat.format(20000)}",
                    style: TextStyle(
                        fontSize: Adaptive.sp(16),
                        fontWeight: FontWeight.w700),
                  ),
                ]),
                Row(children: [
                  Expanded(
                    child: Text(
                      "Payment to: ",
                      style: TextStyle(
                          fontSize: Adaptive.sp(16),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    "Transporter",
                    style: TextStyle(
                        fontSize: Adaptive.sp(16),
                        fontWeight: FontWeight.w700),
                  ),
                ]),
                Row(children: [
                  Expanded(
                    child: Text(
                      "Trip start time: ",
                      style: TextStyle(
                          fontSize: Adaptive.sp(16),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  TextButton(
                      onPressed: () {

                      },
                      child: Text(
                        "$currentDate",
                        style: TextStyle(
                            fontSize: Adaptive.sp(16),
                            fontWeight: FontWeight.w700),
                      )),
                ]),
                Row(children: [
                  Expanded(
                    child: Text(
                      "Trip end time: ",
                      style: TextStyle(
                          fontSize: Adaptive.sp(16),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  TextButton(
                      onPressed: () {

                      },
                      child: Text(
                        "Currently in progress",
                        style: TextStyle(
                            fontSize: Adaptive.sp(16),
                            fontWeight: FontWeight.w700),
                      )),
                ]),
              ]),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}
