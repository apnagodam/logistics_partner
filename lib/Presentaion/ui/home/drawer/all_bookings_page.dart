
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_helper_utils/flutter_helper_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Domain/Rest/data/services/orders/running_orders_service.dart';
import '../../../utils/validators/strings.dart';
import '../../../utils/widgets/widgets.dart';

class AllBookingsPage extends ConsumerWidget {
  const AllBookingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translate('bookings')),
      ),
      body: ref.watch(runningOrdersServiceProvider).when(
          data: (orders) =>orders.orders==null|| orders.orders!.data!.isEmpty
              ? noOrders(context)
              : ListView(
                  children: orders.orders!.data!
                      .map((e) => Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Theme(
                                  data: Theme.of(context).copyWith(
                                      dividerColor: Colors.transparent),
                                  child: ExpansionTile(
                                    initiallyExpanded: true,
                                    trailing: IconButton(
                                        onPressed: () async {
                                          var url = "tel:${e.buyer2Phone}";
                                          if (await canLaunchUrl(
                                              Uri.parse(url))) {
                                            launchUrl(Uri.parse(url));
                                          }
                                        },
                                        icon: Icon(Icons.call)),
                                    expandedCrossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    expandedAlignment: Alignment.topLeft,
                                    subtitle: Text(
                                        "${e.buyer2Phone ?? ""}"),
                                    title: Text(
                                      e.fname ?? "",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    leading: Container(
                                      height: context.heightPx,
                                      width: 50,
                                      child: imageLoader(
                                        "$IMAGE_BASE_URL_user_photo/${e.profileImage}",
                                      ),
                                    ),
                                    children: [

                                      DataTable(columns: [
                                        DataColumn(label: Row(children: [Text('Seller Name')],)),
                                        DataColumn(label: Row(children: [Text('Details')],))

                                      ], rows: [
                                        DataRow(cells: [
                                          DataCell(Text(
                                            'Details: ${e.takeHomePrice??""}'
                                          )),
                                          DataCell(Text(
                                              'Commodity: ${e.category??""}'
                                          )),

                                        ])
                                      ]),
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      Row(
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  context.showSnackBar(
                                                      const SnackBar(
                                                          content: Text(
                                                              'Print Report')));
                                                },
                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty
                                                        .resolveWith((states) =>
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10))),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .resolveWith(
                                                                (states) =>
                                                                    Colors
                                                                        .red)),
                                                child:  Text(
                                                  e.pricingStatus==2?
                                                  'Weight Pending':"Pricing Pending",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    context.showSnackBar(
                                                        const SnackBar(
                                                            content: Text(
                                                                'Order Accpeted')));
                                                  },
                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty
                                                          .resolveWith((states) =>
                                                              RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10))),
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .resolveWith(
                                                                  (states) => context
                                                                      .themeData
                                                                      .primaryColor)),
                                                  child: const Text(
                                                    'Accept Order',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )))
                                        ],
                                      )
                                    ],
                                  )),
                            ),
                          ))
                      .toList(),
                ),
          error: (e, s) {
            print(s);
            return Container(
              child: Text('$e $s'),
            );
          },
          loading: () => loader()),
    );
  }
}
