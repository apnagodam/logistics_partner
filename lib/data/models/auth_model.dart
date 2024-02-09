import 'dart:convert';

class AuthenticationModel {
  String? authorization;
  List<Bank>? banks;
  int? active;
  UserDetails? userDetails;
  int? status;
  String? message;

  AuthenticationModel({
    this.authorization,
    this.banks,
    this.active,
    this.userDetails,
    this.status,
    this.message,
  });

  factory AuthenticationModel.fromJson(String str) =>
      AuthenticationModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthenticationModel.fromMap(Map<String, dynamic> json) =>
      AuthenticationModel(
        authorization: json["Authorization"],
        banks: json["banks"] == null
            ? []
            : List<Bank>.from(json["banks"]!.map((x) => Bank.fromMap(x))),
        active: json["active"],
        userDetails: json["user_details"] == null
            ? null
            : UserDetails.fromMap(json["user_details"]),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "Authorization": authorization,
        "banks": banks == null
            ? []
            : List<dynamic>.from(banks!.map((x) => x.toMap())),
        "active": active,
        "user_details": userDetails?.toMap(),
        "status": status,
        "message": message,
      };
}

class Bank {
  String? bankName;

  Bank({
    this.bankName,
  });

  factory Bank.fromJson(String str) => Bank.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Bank.fromMap(Map<String, dynamic> json) => Bank(
        bankName: json["bank_name"],
      );

  Map<String, dynamic> toMap() => {
        "bank_name": bankName,
      };
}

class UserDetails {
  int? id;
  int? userId;
  int? type;
  String? uniqueId;
  String? phone;
  String? email;
  String? name;
  int? age;
  String? fullAddress;
  String? latitude;
  String? longitude;
  String? passportImage;
  String? drivingLicenceNo;
  dynamic drivingLicenceImage;
  String? drivingLicenceExpiryDate;
  int? facilities;
  String? bankName;
  String? bankIfscCode;
  String? accountNo;
  dynamic? aadharNo;
  String? pancardNo;
  String? aadharImage;
  String? pancardImage;
  String? passbookImage;
  String? imagePath;
  int? onlineOffline;
  String? liveLat;
  String? liveLong;
  int? approveBy;
  int? verifyBy;
  dynamic lpPowerby;
  int? approve;
  int? verify;
  int? autoAccept;
  int? booked;
  String? lpPower;
  String? lpCommission;
  int? intentionLimit;
  int? tripStatus;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? vehicleType;
  String? vehicleCapMin;
  String? vehicleCapMax;

  UserDetails({
    this.id,
    this.userId,
    this.type,
    this.uniqueId,
    this.phone,
    this.email,
    this.name,
    this.age,
    this.fullAddress,
    this.latitude,
    this.longitude,
    this.passportImage,
    this.drivingLicenceNo,
    this.drivingLicenceImage,
    this.drivingLicenceExpiryDate,
    this.facilities,
    this.bankName,
    this.bankIfscCode,
    this.accountNo,
    this.vehicleType,
    this.vehicleCapMax,
    this.vehicleCapMin,
    this.aadharNo,
    this.pancardNo,
    this.aadharImage,
    this.pancardImage,
    this.passbookImage,
    this.imagePath,
    this.onlineOffline,
    this.liveLat,
    this.liveLong,
    this.approveBy,
    this.verifyBy,
    this.lpPowerby,
    this.approve,
    this.verify,
    this.autoAccept,
    this.booked,
    this.lpPower,
    this.lpCommission,
    this.intentionLimit,
    this.tripStatus,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory UserDetails.fromJson(String str) =>
      UserDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserDetails.fromMap(Map<String, dynamic> json) => UserDetails(
        id: json["id"],
        userId: json["user_id"],
        type: json["type"],
        uniqueId: json["unique_id"],
        phone: json["phone"],
        email: json["email"],
        name: json["name"],
        age: json["age"],
        fullAddress: json["full_address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        passportImage: json["passport_image"],
        drivingLicenceNo: json["driving_licence_no"],
        drivingLicenceImage: json["driving_licence_image"],
        drivingLicenceExpiryDate: json["driving_licence_expiry_date"] == null
            ? null
            : json["driving_licence_expiry_date"],
        facilities: json["facilities"],
        bankName: json["bank_name"],
        bankIfscCode: json["bank_ifsc_code"],
        accountNo: json["account_no"],
        aadharNo: json["aadhar_no"],
        vehicleType: json["vehicle_type"],
        vehicleCapMin: json["vehicle_capacity_min"],
        vehicleCapMax: json["vehicle_capacity_max"],
        pancardNo: json["pancard_no"],
        aadharImage: json["aadhar_image"],
        pancardImage: json["pancard_image"],
        passbookImage: json["passbook_image"],
        imagePath: json["image_path"],
        onlineOffline: json["online_offline"],
        liveLat: json["live_lat"],
        liveLong: json["live_long"],
        approveBy: json["approve_by"],
        verifyBy: json["verify_by"],
        lpPowerby: json["lp_powerby"],
        approve: json["approve"],
        verify: json["verify"],
        autoAccept: json["auto_accept"],
        booked: json["booked"],
        lpPower: json["lp_power"],
        lpCommission: json["lp_commission"],
        intentionLimit: json["intention_limit"],
        tripStatus: json["trip_status"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "type": type,
        "unique_id": uniqueId,
        "phone": phone,
        "email": email,
        "name": name,
        "age": age,
        "full_address": fullAddress,
        "latitude": latitude,
        "longitude": longitude,
        "passport_image": passportImage,
        "driving_licence_no": drivingLicenceNo,
        "driving_licence_image": drivingLicenceImage,
        "driving_licence_expiry_date": "$drivingLicenceExpiryDate",
        "facilities": facilities,
        "bank_name": bankName,
        "bank_ifsc_code": bankIfscCode,
        "account_no": accountNo,
        "aadhar_no": aadharNo,
        "vehicle_type": vehicleType,
        "vehicle_capacity_min": vehicleCapMin,
        "vehicle_capacity_max": vehicleCapMax,
        "pancard_no": pancardNo,
        "aadhar_image": aadharImage,
        "pancard_image": pancardImage,
        "passbook_image": passbookImage,
        "image_path": imagePath,
        "online_offline": onlineOffline,
        "live_lat": liveLat,
        "live_long": liveLong,
        "approve_by": approveBy,
        "verify_by": verifyBy,
        "lp_powerby": lpPowerby,
        "approve": approve,
        "verify": verify,
        "auto_accept": autoAccept,
        "booked": booked,
        "lp_power": lpPower,
        "lp_commission": lpCommission,
        "intention_limit": intentionLimit,
        "trip_status": tripStatus,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
