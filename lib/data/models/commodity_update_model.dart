// To parse this JSON data, do
//
//     final qualityUpdateModel = qualityUpdateModelFromJson(jsonString);

import 'dart:convert';

QualityUpdateModel qualityUpdateModelFromJson(String str) =>
    QualityUpdateModel.fromJson(json.decode(str));

String qualityUpdateModelToJson(QualityUpdateModel data) =>
    json.encode(data.toJson());

class QualityUpdateModel {
  String bardanaRate;
  String bookingId;
  String finalPrice;
  String priceVariation;
  List<QualityVariation> qualityVariation;

  QualityUpdateModel({
    required this.bardanaRate,
    required this.bookingId,
    required this.finalPrice,
    required this.priceVariation,
    required this.qualityVariation,
  });

  factory QualityUpdateModel.fromJson(Map<String, dynamic> json) =>
      QualityUpdateModel(
        bardanaRate: json["bardana_rate"],
        bookingId: json["booking_id"],
        finalPrice: json["final_price"],
        priceVariation: json["price_variation"],
        qualityVariation: List<QualityVariation>.from(
            json["quality_variation"].map((x) => QualityVariation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bardana_rate": bardanaRate,
        "booking_id": bookingId,
        "final_price": finalPrice,
        "price_variation": priceVariation,
        "quality_variation":
            List<dynamic>.from(qualityVariation.map((x) => x.toJson())),
      };
}

class QualityVariation {
  String id;
  String max;
  String min;
  String name;
  String qv;
  String value;

  QualityVariation({
    required this.id,
    required this.max,
    required this.min,
    required this.name,
    required this.qv,
    required this.value,
  });

  factory QualityVariation.fromJson(Map<String, dynamic> json) =>
      QualityVariation(
        id: json["id"],
        max: json["max"],
        min: json["min"],
        name: json["name"],
        qv: json["qv"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "max": max,
        "min": min,
        "name": name,
        "qv": qv,
        "value": value,
      };
}
