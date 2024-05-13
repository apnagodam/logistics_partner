import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WSPHomeScreen extends ConsumerWidget {
  const WSPHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.wallet))],
      ),
      drawer: Drawer(),
      body: ListView(
        children: [
          Card(
            margin: Pad(all: Adaptive.sp(15)),
            child: Padding(
              padding: Pad(
                all: Adaptive.sp(20),
              ),
              child: ColumnSuper(alignment: Alignment.centerLeft, children: [
                Row(
                  children: [
                    Icon(Icons.wallet),
                    SizedBox(
                      width: Adaptive.sp(10),
                    ),
                    Text(
                      "Total Rent",
                      style: TextStyle(fontSize: Adaptive.sp(18)),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text("35000", style: TextStyle(fontSize: Adaptive.sp(22)))
              ]),
            ),
          ),
          RowSuper(
            fill: true,
            children: [
              Card(
                margin: Pad(all: Adaptive.sp(15)),
                child: Padding(
                  padding: Pad(
                    all: Adaptive.sp(20),
                  ),
                  child: ColumnSuper(alignment: Alignment.center, children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "IN",
                          style: TextStyle(fontSize: Adaptive.sp(18)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("35000", style: TextStyle(fontSize: Adaptive.sp(22)))
                  ]),
                ),
              ),
              Card(
                margin: Pad(all: Adaptive.sp(15)),
                child: Padding(
                  padding: Pad(
                    all: Adaptive.sp(20),
                  ),
                  child: ColumnSuper(alignment: Alignment.center, children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "OUT",
                          style: TextStyle(fontSize: Adaptive.sp(18)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("35000", style: TextStyle(fontSize: Adaptive.sp(22)))
                  ]),
                ),
              )
            ],
          ),
          Card(
            margin: Pad(all: Adaptive.sp(15)),
            child: Padding(
              padding: Pad(
                all: Adaptive.sp(20),
              ),
              child:RowSuper(
                fill: true,
                children: [
                ColumnSuper(alignment: Alignment.centerLeft, children: [
                  Row(
                    children: [
                      Icon(Icons.wallet),
                      SizedBox(
                        width: Adaptive.sp(10),
                      ),
                      Text(
                        "My Wallet",
                        style: TextStyle(fontSize: Adaptive.sp(18)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Balance: 35000",
                      style: TextStyle(fontSize: Adaptive.sp(22)))
                ]),
                IconButton.outlined(onPressed: (){}, icon: Icon(Icons.chevron_right))
              ],),
            ),
          ),
        ],
      ),
    );
  }
}
