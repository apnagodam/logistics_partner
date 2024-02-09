import 'dart:convert';

class CommodityCalculationModel {
  int? orderId;
  int? rate;
  List<Parameter>? parameters;

  CommodityCalculationModel({
    this.orderId,
    this.rate,
    this.parameters,
  });

  factory CommodityCalculationModel.fromJson(String str) =>
      CommodityCalculationModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommodityCalculationModel.fromMap(Map<String, dynamic> json) =>
      CommodityCalculationModel(
        orderId: json["order_id"],
        rate: json["rate"],
        parameters: json["parameters"] == null
            ? []
            : List<Parameter>.from(
                json["parameters"]!.map((x) => Parameter.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "order_id": orderId,
        "rate": rate,
        "parameters": parameters == null
            ? []
            : List<dynamic>.from(parameters!.map((x) => x.toMap())),
      };
}

class Parameter {
  int? id;
  String? name;
  int? min;
  int? max;
  int? actual;
  int? value;

  Parameter({
    this.id,
    this.name,
    this.min,
    this.max,
    this.actual,
    this.value,
  });

  factory Parameter.fromJson(String str) => Parameter.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Parameter.fromMap(Map<String, dynamic> json) => Parameter(
        id: json["id"],
        name: json["name"],
        min: json["min"],
        max: json["max"],
        actual: json["actual"],
        value: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "min": min,
        "max": max,
        "actual": actual,
        "value": value,
      };
}
