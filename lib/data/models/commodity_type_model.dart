import 'dart:convert';

import 'package:flutter/widgets.dart';

class CommodityTypeModel {
  List<Category>? categories;
  String? status;
  String? message;

  CommodityTypeModel({
    this.categories,
    this.status,
    this.message,
  });

  factory CommodityTypeModel.fromJson(String str) =>
      CommodityTypeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommodityTypeModel.fromMap(Map<String, dynamic> json) =>
      CommodityTypeModel(
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromMap(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toMap())),
        "status": status,
        "message": message,
      };
}

class Category {
  int? id;
  int? parentCat;
  String? category;
  String? categorySName;
  String? categoryHi;
  String? commodityType;
  int? hsnCode;
  String? gst;
  String? gstOnRent;
  int? agSpotCommission;
  int? agEmandiCommission;
  int? agF2FCommission;
  String? mandiFees;
  String? loading;
  String? bardana;
  String? freight;
  double? stackCommQtlVal;
  int? firstMileRate;
  String? image;
  String? imagePath;
  int? sequenceId;
  int? isGrading;
  int? forGrading;
  int? debitNoteCharges;
  int? lowerCircuit;
  int? upperCircuit;
  int? isFastPath;
  DateTime? month;
  DateTime? expDate;
  int? isActive;
  int? qualityPCondition;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? categoryEn;
  List<QualityParameter>? qualityParameters;
  List<dynamic>? bardanas;

  Category({
    this.id,
    this.parentCat,
    this.category,
    this.categorySName,
    this.categoryHi,
    this.commodityType,
    this.hsnCode,
    this.gst,
    this.gstOnRent,
    this.agSpotCommission,
    this.agEmandiCommission,
    this.agF2FCommission,
    this.mandiFees,
    this.loading,
    this.bardana,
    this.freight,
    this.stackCommQtlVal,
    this.firstMileRate,
    this.image,
    this.imagePath,
    this.sequenceId,
    this.isGrading,
    this.forGrading,
    this.debitNoteCharges,
    this.lowerCircuit,
    this.upperCircuit,
    this.isFastPath,
    this.month,
    this.expDate,
    this.isActive,
    this.qualityPCondition,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.categoryEn,
    this.qualityParameters,
    this.bardanas,
  });

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        parentCat: json["parent_cat"],
        category: json["category"],
        categorySName: json["category_s_name"],
        categoryHi: json["category_hi"],
        commodityType: json["commodity_type"],
        hsnCode: json["hsn_code"],
        gst: json["gst"],
        gstOnRent: json["gst_on_rent"],
        agSpotCommission: json["ag_spot_commission"],
        agEmandiCommission: json["ag_emandi_commission"],
        agF2FCommission: json["ag_f2f_commission"],
        mandiFees: json["mandi_fees"],
        loading: json["loading"],
        bardana: json["bardana"],
        freight: json["freight"],
        stackCommQtlVal: json["stack_comm_qtl_val"]?.toDouble(),
        firstMileRate: json["first_mile_rate"],
        image: json["image"],
        imagePath: json["image_path"],
        sequenceId: json["sequence_id"],
        isGrading: json["is_grading"],
        forGrading: json["for_grading"],
        debitNoteCharges: json["debit_note_charges"],
        lowerCircuit: json["lower_circuit"],
        upperCircuit: json["upper_circuit"],
        isFastPath: json["is_fast_path"],
        month: json["month"] == null ? null : DateTime.parse(json["month"]),
        expDate:
            json["exp_date"] == null ? null : DateTime.parse(json["exp_date"]),
        isActive: json["is_active"],
        qualityPCondition: json["quality_p_condition"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        categoryEn: json["category_en"],
        qualityParameters: json["quality_parameters"] == null
            ? []
            : List<QualityParameter>.from(json["quality_parameters"]!
                .map((x) => QualityParameter.fromMap(x))),
        bardanas: json["bardanas"] == null
            ? []
            : List<dynamic>.from(json["bardanas"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "parent_cat": parentCat,
        "category": category,
        "category_s_name": categorySName,
        "category_hi": categoryHi,
        "commodity_type": commodityType,
        "hsn_code": hsnCode,
        "gst": gst,
        "gst_on_rent": gstOnRent,
        "ag_spot_commission": agSpotCommission,
        "ag_emandi_commission": agEmandiCommission,
        "ag_f2f_commission": agF2FCommission,
        "mandi_fees": mandiFees,
        "loading": loading,
        "bardana": bardana,
        "freight": freight,
        "stack_comm_qtl_val": stackCommQtlVal,
        "first_mile_rate": firstMileRate,
        "image": image,
        "image_path": imagePath,
        "sequence_id": sequenceId,
        "is_grading": isGrading,
        "for_grading": forGrading,
        "debit_note_charges": debitNoteCharges,
        "lower_circuit": lowerCircuit,
        "upper_circuit": upperCircuit,
        "is_fast_path": isFastPath,
        "month":
            "${month!.year.toString().padLeft(4, '0')}-${month!.month.toString().padLeft(2, '0')}-${month!.day.toString().padLeft(2, '0')}",
        "exp_date":
            "${expDate!.year.toString().padLeft(4, '0')}-${expDate!.month.toString().padLeft(2, '0')}-${expDate!.day.toString().padLeft(2, '0')}",
        "is_active": isActive,
        "quality_p_condition": qualityPCondition,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "category_en": categoryEn,
        "quality_parameters": qualityParameters == null
            ? []
            : List<dynamic>.from(qualityParameters!.map((x) => x.toMap())),
        "bardanas":
            bardanas == null ? [] : List<dynamic>.from(bardanas!.map((x) => x)),
      };
}

class QualityParameter {
  int? id;
  int? commodityId;
  int? parameterId;
  int? min;
  int? max;
  int? status;
  String? createdAt;
  String? updatedAt;
  Parameters? parameters;
  TextEditingController? controller;

  QualityParameter(
      {this.id,
      this.commodityId,
      this.parameterId,
      this.min,
      this.max,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.parameters,
      this.controller});

  factory QualityParameter.fromJson(String str) =>
      QualityParameter.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QualityParameter.fromMap(Map<String, dynamic> json) =>
      QualityParameter(
        id: json["id"],
        commodityId: json["commodity_id"],
        parameterId: json["parameter_id"],
        min: json["min"],
        max: json["max"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        parameters: json["parameters"] == null
            ? null
            : Parameters.fromMap(json["parameters"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "commodity_id": commodityId,
        "parameter_id": parameterId,
        "min": min,
        "max": max,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "parameters": parameters?.toMap(),
      };
}

class Parameters {
  int? id;
  String? parameter;
  int? status;
  String? createdAt;
  String? updatedAt;

  Parameters({
    this.id,
    this.parameter,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Parameters.fromJson(String str) =>
      Parameters.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Parameters.fromMap(Map<String, dynamic> json) => Parameters(
        id: json["id"],
        parameter: json["parameter"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "parameter": parameter,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
