import 'dart:convert';

class CommodityCalculationResponseModel {
  String? status;
  String? qualityVariation;
  String? dealType;
  List<QvDatum>? qvData;
  dynamic? intentionPrice;
  dynamic? bardanaRate;
  dynamic? finalPrice;
  dynamic? weight;
  String? userName;
  String? userPhone;
  String? message;

  CommodityCalculationResponseModel({
    this.status,
    this.qualityVariation,
    this.dealType,
    this.qvData,
    this.intentionPrice,
    this.bardanaRate,
    this.finalPrice,
    this.weight,
    this.userName,
    this.userPhone,
    this.message,
  });

  factory CommodityCalculationResponseModel.fromJson(String str) =>
      CommodityCalculationResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommodityCalculationResponseModel.fromMap(
          Map<String, dynamic> json) =>
      CommodityCalculationResponseModel(
        status: json["status"],
        qualityVariation: json["quality_variation"],
        dealType: json["deal_type"],
        qvData: json["qv_data"] == null
            ? []
            : List<QvDatum>.from(
                json["qv_data"]!.map((x) => QvDatum.fromMap(x))),
        intentionPrice: json["intention_price"],
        bardanaRate: json["bardana_rate"],
        finalPrice: json["final_price"],
        weight: json["weight"],
        userName: json["user_name"],
        userPhone: json["user_phone"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "quality_variation": qualityVariation,
        "deal_type": dealType,
        "qv_data": qvData == null
            ? []
            : List<dynamic>.from(qvData!.map((x) => x.toMap())),
        "intention_price": intentionPrice,
        "bardana_rate": bardanaRate,
        "final_price": finalPrice,
        "weight": weight,
        "user_name": userName,
        "user_phone": userPhone,
        "message": message,
      };
}

class QvDatum {
  int? id;
  String? name;
  int? min;
  int? max;
  int? value;
  String? qv;

  QvDatum({
    this.id,
    this.name,
    this.min,
    this.max,
    this.value,
    this.qv,
  });

  factory QvDatum.fromJson(String str) => QvDatum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QvDatum.fromMap(Map<String, dynamic> json) => QvDatum(
        id: json["id"],
        name: json["name"],
        min: json["min"],
        max: json["max"],
        value: json["value"],
        qv: json["qv"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "min": min,
        "max": max,
        "value": value,
        "qv": qv,
      };
}
