import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_helper_utils/flutter_helper_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WSPHomeScreen extends ConsumerWidget {
  const WSPHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef) {
    var currencyFormat = NumberFormat.currency(
        locale: 'HI', symbol: '\u{20B9}', decimalDigits: 2);
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard'), elevation: 10, actions: [
        IconButton(onPressed: () {}, icon: Icon(EneftyIcons.personalcard_bold))
      ]),
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
                      side: BorderSide(color: context.themeData.primaryColor)),
                  margin: Pad(all: Adaptive.sp(15)),
                  child: Padding(
                    padding: Pad(
                      all: Adaptive.sp(20),
                    ),
                    child: ColumnSuper(alignment: Alignment.center, children: [
                      const Icon(EneftyIcons.arrow_circle_down_outline),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Add Money",
                        style: TextStyle(fontSize: Adaptive.sp(15)),
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
                      side: BorderSide(color: context.themeData.primaryColor)),
                  margin: Pad(all: Adaptive.sp(15)),
                  child: Padding(
                    padding: Pad(
                      all: Adaptive.sp(20),
                    ),
                    child: ColumnSuper(alignment: Alignment.center, children: [
                      const Icon(EneftyIcons.arrow_circle_up_outline),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Withdraw Money",
                        style: TextStyle(fontSize: Adaptive.sp(15)),
                      )
                    ]),
                  ),
                ),
              )),
            ],
          ),
          SizedBox(
            width: context.widthPx,
            child: Card(
              elevation: 10,
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: context.themeData.primaryColor)),
              margin: Pad(all: Adaptive.sp(15)),
              child: Padding(
                padding: Pad(
                  all: Adaptive.sp(20),
                ),
                child: ColumnSuper(alignment: Alignment.center, children: [
                  const Icon(EneftyIcons.book_2_outline),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Transactions History",
                    style: TextStyle(fontSize: Adaptive.sp(15)),
                  )
                ]),
              ),
            ),
          ),
          Padding(
            padding: Pad(
              all: Adaptive.sp(10),
            ),
            child: ColumnSuper(
              alignment: Alignment.centerLeft,
              children: [
                Text(
                  "Recent Transactions",
                  style: TextStyle(fontSize: Adaptive.sp(18)),
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: Pad(all: 0),
                    itemCount: 10,
                    itemBuilder: (context, index) => Card(
                        surfaceTintColor: Colors.white,
                        color: Colors.white,
                        elevation: 10,
                        margin: Pad(all: 10),
                        child: Padding(
                          padding: Pad(all: 10),
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
                                      style:
                                          TextStyle(fontSize: Adaptive.sp(14)),
                                    ),
                                    Text(
                                      'transaction date',
                                      style:
                                          TextStyle(fontSize: Adaptive.sp(14)),
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
          ),
        ],
      ),
    );
  }

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
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text('Enter Amount')),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: context.widthPx,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      side: BorderSide(color: context.themeData.primaryColor)),
                  onPressed: () {},
                  child: Text("Submit")),
            ),
            SizedBox(
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
                    border: OutlineInputBorder(), label: Text('Enter Amount')),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: context.widthPx,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      side: BorderSide(color: context.themeData.primaryColor)),
                  onPressed: () {},
                  child: Text("Submit")),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      );
}
