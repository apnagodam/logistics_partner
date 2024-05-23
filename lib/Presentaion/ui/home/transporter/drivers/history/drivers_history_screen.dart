import 'package:ag_logistics_partner/Presentaion/utils/constants/color_constants.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DriversHistory extends ConsumerWidget {
  const DriversHistory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Drivers",
            style: TextStyle(
                fontSize: Adaptive.sp(18), fontWeight: FontWeight.w700),
          ),
          leading: IconButton(
            icon: const Icon(
              CupertinoIcons.back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          titleTextStyle: const TextStyle(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: [
            Column(children: [
               Container(
                 padding: Pad(all: 10),
                 color: ColorConstants.primaryColorDriver,
                 child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Center(child: Text(
                      '#',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),),
                  ),
                  Expanded(
                    child: Center(child: Text(
                      'Driver Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),),
                  ),
                  Expanded(
                    child: Center(child: Text(
                      'Payment Type',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),),
                  ),
                  Expanded(
                    child: Center(child: Text(
                      'Amount',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),),
                  ),
                  Expanded(
                    child: Center(child: Text(
                      'Status',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),),
                  )
                ],
              ),),
             Container(

               child:  Column(
               children: List.generate(
                   10,
                       (index) => Container(
                         padding: Pad(all: 10),

                         color: index%2==0?Colors.grey.withOpacity(0.2):Colors.white,
                         child:
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Expanded(
                               child: Center(child: Text(
                                 "${++index}",
                                 style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                 ),
                               ),)),
                           Expanded(
                             child: Center(child: Text(
                               'Ram narayan bhardwaj',
                               maxLines: 3,
                               style: TextStyle(
                                 fontWeight: FontWeight.bold,
                               ),
                             ),),
                           ),
                           Expanded(
                             child: Center(child: Text(
                               index%4==0?'cheque':'cash',
                               style: TextStyle(
                                 fontWeight: FontWeight.bold,
                               ),
                             ),),
                           ),
                           Expanded(
                             child: Center(child: Text(
                               '1400',
                               style: TextStyle(
                                 fontWeight: FontWeight.bold,
                               ),
                             ),),
                           ),
                           Expanded(
                             child: Center(child: Text(
                               index % 4 == 0 ? "paid" : "rejected",
                               style: TextStyle(
                                 fontWeight: FontWeight.bold,
                               ),
                             ),),
                           )
                         ],
                       ),)),
             ),)
            ]),
          ],
        ));
  }
}
