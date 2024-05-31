// To parse this JSON data, do
//
//     final agAuthenticationModel = agAuthenticationModelFromMap(jsonString);

import 'dart:convert';

AgAuthenticationModel agAuthenticationModelFromMap(String str) => AgAuthenticationModel.fromMap(json.decode(str));

String agAuthenticationModelToMap(AgAuthenticationModel data) => json.encode(data.toMap());

class AgAuthenticationModel {
  String? authorization;
  int? active;
  UserDetails? userDetails;
  int? status;
  String? message;

  AgAuthenticationModel({
    this.authorization,
    this.active,
    this.userDetails,
    this.status,
    this.message,
  });

  factory AgAuthenticationModel.fromMap(Map<String, dynamic> json) => AgAuthenticationModel(
    authorization: json["Authorization"],
    active: json["active"],
    userDetails: json["user_details"] == null ? null : UserDetails.fromMap(json["user_details"]),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "Authorization": authorization,
    "active": active,
    "user_details": userDetails?.toMap(),
    "status": status,
    "message": message,
  };
}

class UserDetails {
  int? id;
  int? userId;
  String? name;
  String? email;
  String? phone;
  int? wallet;
  String? address;
  String? city;
  String? state;
  int? pincode;
  String? bankName;
  String? accountNo;
  String? ifscCode;
  dynamic gstNumber;
  dynamic chequePassbook;
  dynamic pancardImage;
  dynamic aadharImage;
  String? pancardNo;
  String? aadharNo;
  dynamic image;
  int? verify;
  String? power;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserDetails({
    this.id,
    this.userId,
    this.name,
    this.email,
    this.phone,
    this.wallet,
    this.address,
    this.city,
    this.state,
    this.pincode,
    this.bankName,
    this.accountNo,
    this.ifscCode,
    this.gstNumber,
    this.chequePassbook,
    this.pancardImage,
    this.aadharImage,
    this.pancardNo,
    this.aadharNo,
    this.image,
    this.verify,
    this.power,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory UserDetails.fromMap(Map<String, dynamic> json) => UserDetails(
    id: json["id"],
    userId: json["user_id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    wallet: json["wallet"],
    address: json["address"],
    city: json["city"],
    state: json["state"],
    pincode: json["pincode"],
    bankName: json["bank_name"],
    accountNo: json["account_no"],
    ifscCode: json["ifsc_code"],
    gstNumber: json["gst_number"],
    chequePassbook: json["cheque_passbook"],
    pancardImage: json["pancard_image"],
    aadharImage: json["aadhar_image"],
    pancardNo: json["pancard_no"],
    aadharNo: json["aadhar_no"],
    image: json["image"],
    verify: json["verify"],
    power: json["power"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "name": name,
    "email": email,
    "phone": phone,
    "wallet": wallet,
    "address": address,
    "city": city,
    "state": state,
    "pincode": pincode,
    "bank_name": bankName,
    "account_no": accountNo,
    "ifsc_code": ifscCode,
    "gst_number": gstNumber,
    "cheque_passbook": chequePassbook,
    "pancard_image": pancardImage,
    "aadhar_image": aadharImage,
    "pancard_no": pancardNo,
    "aadhar_no": aadharNo,
    "image": image,
    "verify": verify,
    "power": power,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
