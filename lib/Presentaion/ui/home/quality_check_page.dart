
import 'package:ag_logistics_partner/Domain/providers/commodity/commodity_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_helper_utils/flutter_helper_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Data/models/commodity_calculation_model.dart';
import '../../../Data/models/commodity_update_model.dart';
import '../../utils/widgets/widgets.dart';


List<TextEditingController> controllersList = [];
List<Parameter> parametersList = [];

class QualityCheckPage extends ConsumerWidget {
  const QualityCheckPage(
      {super.key,
      required this.commodityId,
      required this.orderId,
      required this.rate});
  final int? commodityId;
  final int? orderId;
  final int? rate;
  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return Scaffold(
        appBar: AppBar(
          title: const Text('Quality Variance Report'),
        ),
        body: ref.watch(commodityParametersProvider(8)).when(
            data: (commodity) => ListView(
                  children: [
                    Expanded(
                        child: DataTable(
                            columnSpacing: 10,
                            showBottomBorder: true,
                            decoration: BoxDecoration(
                                color:
                                    context.themeData.colorScheme.background),
                            columns: const [
                              DataColumn(
                                label: Row(
                                  children: [
                                    Text(
                                      "Parameter",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              DataColumn(
                                label: Row(
                                  children: [
                                    Text("Min",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              DataColumn(
                                label: Row(
                                  children: [
                                    Text("Max",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                              DataColumn(
                                label: Row(
                                  children: [
                                    Text("Value",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                              DataColumn(
                                label: Row(
                                  children: [
                                    Text("Difference",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              )

                            ],
                            rows: List.generate(
                                commodity.qualityParameters!.length, (index) {
                              var e = commodity.qualityParameters![index];
                              controllersList.clear();
                              for (int i = 0;
                                  i < commodity.qualityParameters!.length;
                                  i++) {
                                controllersList.add(TextEditingController());
                              }

                              return DataRow(cells: [
                                DataCell(Text(e.parameters?.parameter ?? "")),
                                DataCell(Text(e.min.toString() ?? "")),
                                DataCell(Text(e.max.toString() ?? "")),
                                DataCell(TextFormField(
                                  controller: controllersList[index],
                                  onEditingComplete: () {
                                    successToast(orderId.toString());
                                  },
                                  onChanged: (value) {
                                    controllersList[index].text = value;
                                  },
                                )),
                                ref
                                    .watch(commodityCalculationProvider(
                                        ref.watch(calculationModelProvider)))
                                    .when(
                                        data: (data) => DataCell(Text(
                                            data.qvData![0].qv.toString() ??
                                                "0")),
                                        error: (e, s) =>
                                            const DataCell(Text('0')),
                                        loading: () => const DataCell(
                                            CircularProgressIndicator())),
                              ]);
                            }))),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.resolveWith(
                                    (states) => RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (states) =>
                                            context.themeData.primaryColor)),
                            onPressed: () {

                              for (int i = 0;
                                  i < commodity.qualityParameters!.length;
                                  i++) {
                                parametersList.add(Parameter(
                                    id: commodity
                                        ?.qualityParameters![i].parameterId,
                                    name: commodity.qualityParameters![i]
                                        .parameters?.parameter,
                                    min: commodity.qualityParameters![i].min,
                                    max: commodity.qualityParameters![i].max,
                                    actual: int.parse(
                                        controllersList[i].text.toString()),
                                    value: int.parse(
                                        controllersList[i].text.toString())));
                              }
                               
                              ref
                                      .watch(calculationModelProvider.notifier)
                                      .state =
                                  CommodityCalculationModel(
                                      orderId: orderId,
                                      rate: rate,
                                      parameters: parametersList);

                              ref.watch(commodityProvider).calculateParameters(commodityCalculationModel: ref.watch(calculationModelProvider));

                            },
                            child: const Text(
                              'Check Quality',
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ref
                        .watch(commodityCalculationProvider(
                            ref.watch(calculationModelProvider)))
                        .when(
                            data: (data) => Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Final Report',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        )
                                      ],
                                    ),
                                    Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                            child: DataTable(columns: const [
                                          DataColumn(
                                            label: Row(
                                              children: [
                                                Text(
                                                  "Qv Price",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                          DataColumn(
                                            label: Row(
                                              children: [
                                                Text(
                                                  "Final Price",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                        ], rows: [
                                          DataRow(cells: [
                                            DataCell(
                                              Text(data.qualityVariation
                                                      .toString() ??
                                                  ""),
                                            ),
                                            DataCell(Text(
                                                data.finalPrice.toString() ??
                                                    "")),
                                          ])
                                        ])),
                                      ],
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        List<QualityVariation>
                                            qualityVariation = [];
                                        parametersList.forEach((element) {
                                          qualityVariation.add(QualityVariation(
                                              id: element.id.toString() ?? "0",
                                              name: element.name ?? "",
                                              min: element.min.toString() ??
                                                  "null",
                                              max: element.max.toString() ??
                                                  "null",
                                              value: element.value.toString() ??
                                                  "null",
                                              qv: data.qualityVariation
                                                      .toString() ??
                                                  "null"));
                                        });
                                        var commodityQualityUpdate =
                                            QualityUpdateModel(
                                                priceVariation:
                                                    data
                                                        .qualityVariation
                                                        .toString(),
                                                bardanaRate:
                                                    data
                                                            .bardanaRate
                                                            .toString() ??
                                                        "0",
                                                bookingId: orderId.toString(),
                                                finalPrice: data
                                                    .qualityVariation
                                                    .toString(),
                                                qualityVariation:
                                                    qualityVariation);

                                        ref.read(commodityProvider).lpQualityUpdate(qualityUpdateModel: commodityQualityUpdate)
                                        .then((value) => successToast(
                                            value['message'].toString()));

                                      },
                                      child: Text(
                                        'Submit',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty
                                              .resolveWith((states) =>
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10))),
                                          backgroundColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) => context
                                                      .themeData.primaryColor)),
                                    )
                                  ],
                                ),
                            error: (e, s) => Container(),
                            loading: () => loader())
                  ],
                ),
            error: (e, s) => const Text('data'),
            loading: () => loader()));
  }
}

var calculationModelProvider =
    StateProvider((ref) => CommodityCalculationModel());
