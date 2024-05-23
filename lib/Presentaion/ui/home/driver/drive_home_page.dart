import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_helper_utils/flutter_helper_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/constants/color_constants.dart';
import '../WSP/wsp_home_screen.dart';

class DriverHomePage extends ConsumerWidget {
  const DriverHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        children: [
          ColumnSuper(alignment: Alignment.center, children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Text(
              "Current Balance",
              style: TextStyle(
                  fontSize: Adaptive.sp(15), fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(currencyFormat.format(35000.00),
                style: TextStyle(
                    fontSize: Adaptive.sp(25), fontWeight: FontWeight.w700))
          ]),
          Row(
            children: [
              Expanded(
                  child: InkWell(
                child: Card(
                  elevation: 10,
                  surfaceTintColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(
                        color: ColorConstants.primaryColorDriver,
                      )),
                  margin: Pad(all: Adaptive.sp(15)),
                  child: Padding(
                    padding: Pad(
                      all: Adaptive.sp(20),
                    ),
                    child: ColumnSuper(alignment: Alignment.center, children: [
                      const Icon(
                        EneftyIcons.money_add_outline,
                        color: ColorConstants.primaryColorDriver,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Add Money",
                        style: TextStyle(
                            fontSize: Adaptive.sp(16),
                            fontWeight: FontWeight.w700),
                      )
                    ]),
                  ),
                ),
                onTap: () {
                  showBarModalBottomSheet(
                      context: context,
                      builder: (context) => addMoney(context),
                      expand: false);
                  //    context.pushPage(AddMoneyScreen());
                },
              )),
              Expanded(
                  child: InkWell(
                onTap: () {
                  showBarModalBottomSheet(
                      context: context,
                      builder: (context) => withdrawMoney(context),
                      expand: false);
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
                        EneftyIcons.money_remove_outline,
                        color: ColorConstants.primaryColorDriver,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Withdraw Money",
                        style: TextStyle(
                            fontSize: Adaptive.sp(16),
                            fontWeight: FontWeight.w700),
                      )
                    ]),
                  ),
                ),
              )),
            ],
          ),
          SizedBox(
            width: context.widthPx,
            child: InkWell(
              onTap: () {
                showBarModalBottomSheet(
                    context: context,
                    builder: (context) => transactionsHistoryLayout(),
                    expand: true);
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
                      EneftyIcons.book_2_outline,
                      color: ColorConstants.primaryColorDriver,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Transactions History",
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

  transactionsHistoryLayout() => Padding(
        padding: Pad(
          all: Adaptive.sp(10),
        ),
        child: ColumnSuper(
          alignment: Alignment.centerLeft,
          children: [
            Padding(
              padding: const Pad(all: 10),
              child: Text(
                "Recent Transactions",
                style: TextStyle(fontSize: Adaptive.sp(18)),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                padding: const Pad(all: 0),
                itemCount: 20,
                itemBuilder: (context, index) => Card(
                    surfaceTintColor: Colors.white,
                    color: Colors.white,
                    elevation: 10,
                    margin: const Pad(all: 10),
                    child: Padding(
                      padding: const Pad(all: 10),
                      child: ColumnSuper(
                        alignment: Alignment.topLeft,
                        children: [
                          RowSuper(fill: true, children: [
                            ColumnSuper(
                              alignment: Alignment.topLeft,
                              children: [
                                Text(
                                  "Transaction ID",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: Adaptive.sp(16)),
                                ),
                                Text(
                                  'transaction type',
                                  style: TextStyle(fontSize: Adaptive.sp(14)),
                                ),
                                Text(
                                  'transaction date',
                                  style: TextStyle(fontSize: Adaptive.sp(14)),
                                )
                              ],
                            ),
                            ColumnSuper(
                              alignment: Alignment.topRight,
                              children: [
                                Text(
                                  "${index % 2 == 0 ? currencyFormat.format(-350000) : currencyFormat.format(350000)}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: Adaptive.sp(16),
                                      color: index % 2 == 0
                                          ? Colors.red
                                          : Colors.green),
                                ),
                              ],
                            )
                          ])
                        ],
                      ),
                    )))
          ],
        ),
      );

  addMoney(BuildContext context) => Padding(
        padding: Pad(
            top: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 10),
        child: ColumnSuper(
          alignment: Alignment.topLeft,
          children: [
            Text("Add Money",
                style: TextStyle(
                    fontSize: Adaptive.sp(22), fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            Center(
              child: TextFormField(
                decoration: InputDecoration(
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

  withdrawMoney(BuildContext context) => Padding(
        padding: Pad(
            top: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 10),
        child: ColumnSuper(
          alignment: Alignment.topLeft,
          children: [
            Text("Withdraw Money",
                style: TextStyle(
                    fontSize: Adaptive.sp(22), fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            Center(
              child: TextFormField(
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
}
