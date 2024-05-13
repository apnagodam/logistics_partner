import 'dart:convert';

class OtpResponseModel {
  String? phone;
  String? status;
  String? otp;
  String? message;

  OtpResponseModel({
    this.phone,
    this.status,
    this.otp,
    this.message,
  });

  factory OtpResponseModel.fromJson(String str) => OtpResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OtpResponseModel.fromMap(Map<String, dynamic> json) => OtpResponseModel(
    phone: json["phone"],
    status: json["status"],
    otp: json["otp"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "phone": phone,
    "status": status,
    "otp": otp,
    "message": message,
  };
}
