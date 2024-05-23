import 'package:ag_logistics_partner/Presentaion/ui/home/transporter/drivers/add_drivers_screen.dart';
import 'package:ag_logistics_partner/Presentaion/ui/home/transporter/drivers/history/drivers_history_screen.dart';
import 'package:ag_logistics_partner/Presentaion/ui/home/transporter/enquiries/all_enquires_screen.dart';
import 'package:ag_logistics_partner/Presentaion/utils/constants/style_constants.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_helper_utils/flutter_helper_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';

import '../../../../utils/constants/color_constants.dart';
import '../../WSP/wsp_home_screen.dart';

var currentDate = DateTime.now();

class TransporterHomePage extends ConsumerWidget {
  const TransporterHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var panelController = PanelController();
    return Scaffold(
      body: ListView(
        children: [
          ColumnSuper(alignment: Alignment.center, children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Padding(
              padding: Pad(all: 10),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "Running Enquiries",
                    textAlign: TextAlign.center,
                    style: StyleConstants.titleStyle(),
                  )),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AllEnquiriesScreen()));
                      },
                      child: Text(
                        "All Enquiries",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                            fontSize: Adaptive.sp(14)),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: context.widthPx,
              height: Adaptive.h(30),
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
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
                      )),
            ),
          ]),
          Padding(
            padding: Pad(all: 10),
            child: Text(
              "Truck",
              style: StyleConstants.titleStyle(),
            ),
          ),
          SizedBox(
            width: context.widthPx,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DriversHistory()));
              },
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
                    all: Adaptive.sp(20),
                  ),
                  child: ColumnSuper(alignment: Alignment.center, children: [
                    const Icon(
                      EneftyIcons.truck_time_outline,
                      color: ColorConstants.primaryColorDriver,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Drivers Requests History",
                      style: TextStyle(
                          fontSize: Adaptive.sp(16),
                          fontWeight: FontWeight.w700),
                    )
                  ]),
                ),
              ),
            ),
          ),
          SizedBox(
            width: context.widthPx,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddDriversScreen()));
              },
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
                    all: Adaptive.sp(20),
                  ),
                  child: ColumnSuper(alignment: Alignment.center, children: [
                    const Icon(
                      EneftyIcons.truck_fast_outline,
                      color: ColorConstants.primaryColorDriver,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Add Truck",
                      style: TextStyle(
                          fontSize: Adaptive.sp(16),
                          fontWeight: FontWeight.w700),
                    )
                  ]),
                ),
              ),
            ),
          ),
        ],
      ),
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
                          onPressed: () {},
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
