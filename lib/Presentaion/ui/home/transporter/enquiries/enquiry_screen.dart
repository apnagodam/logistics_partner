import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_helper_utils/flutter_helper_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../utils/constants/color_constants.dart';
import '../../../../utils/constants/string_constants.dart';
import '../../../../utils/constants/style_constants.dart';
import '../../WSP/wsp_home_screen.dart';

class EnquiryScreen extends ConsumerWidget {
  EnquiryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var currentDate = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Enquiries",
          style: StyleConstants.titleStyle(),
        ),
      ),
      body: ColumnSuper(
        children: [
          SizedBox(
            width: context.widthPx,
            height: context.heightPx,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                shrinkWrap: true,
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
                          padding: const Pad(
                            all: 10,
                          ),
                          child: ColumnSuper(
                            alignment: Alignment.centerLeft,
                            children: [
                              Text(
                                "Date: ${currentDate}",
                                style: StyleConstants.normalStyle(),
                              ),
                              const SizedBox(
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
                                    const SizedBox(
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
                                      TextButton(
                                          onPressed: () {
                                            showBarModalBottomSheet(
                                                context: context,
                                                builder: (context) =>
                                                    changeEnquiryAmount(
                                                        context, ref),
                                                expand: false);
                                          },
                                          child: Text(
                                            "${currencyFormat.format(ref.watch(freightRateProvider))} per Qtl",
                                            style: TextStyle(
                                                color: ColorConstants
                                                    .primaryColorDriver,
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: Adaptive.sp(16),
                                                fontWeight: FontWeight.w700),
                                          )),
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
                                      // Text(
                                      //   "Transporter",
                                      //   style: TextStyle(
                                      //       fontSize: Adaptive.sp(16),
                                      //       fontWeight: FontWeight.w700),
                                      // ),
                                      DropdownButton(
                                        // Initial Value
                                        value: ref.watch(stateProvider),

                                        // Down Arrow Icon
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),

                                        // Array list of items
                                        items: StringContants.paymentType
                                            .map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items),
                                          );
                                        }).toList(),
                                        // After selecting the desired option,it will
                                        // change button value to selected value
                                        onChanged: (String? newValue) {
                                          ref
                                                  .watch(stateProvider.notifier)
                                                  .state =
                                              newValue ?? "Select State";
                                        },
                                      ),
                                    ]),

                                    SizedBox(height: 10,),
                                    SizedBox(width: context.widthPx,child: ElevatedButton(
                                        style: StyleConstants.submitButtonStyle(borderColor: Colors.white, backgroundColor: ColorConstants.primaryColorDriver),
                                        onPressed: (){}, child: Text('Submit')),)
                                  ]),
                            ],
                          ),
                        ),
                      ),
                    )),
          ),
        ],
      ),
    );
  }

  var stateProvider = StateProvider<String?>((ref) => null);

  changeEnquiryAmount(BuildContext context, WidgetRef ref) => Padding(
        padding: Pad(
            top: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 10),
        child: ColumnSuper(
          alignment: Alignment.topLeft,
          children: [
            Text("Set Amount",
                style: TextStyle(
                    fontSize: Adaptive.sp(22), fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            Center(
              child: TextFormField(
                initialValue: ref.watch(freightRateProvider).toString(),
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    ref.watch(freightRateProvider.notifier).state = value.toInt,
                decoration: const InputDecoration(
                    contentPadding: Pad(left: 10),
                    iconColor: ColorConstants.primaryColorDriver,
                    prefixIcon: Icon(
                      Icons.currency_rupee,
                      color: ColorConstants.primaryColorDriver,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorConstants.primaryColorDriver)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorConstants.primaryColorDriver)),
                    labelStyle:
                        TextStyle(color: ColorConstants.primaryColorDriver),
                    label: Text('Enter Amount')),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: context.widthPx,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.primaryColorDriver,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      side: const BorderSide(
                          color: ColorConstants.primaryColorDriver)),
                  onPressed: () {},
                  child: const Text("Submit")),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      );

  var freightRateProvider = StateProvider((ref) => 110);
}
