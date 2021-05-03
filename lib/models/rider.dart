// To parse this JSON data, do
//
//     final rider = riderFromJson(jsonString);

import 'dart:convert';

Rider riderFromJson(String str) => Rider.fromJson(json.decode(str));

String riderToJson(Rider data) => json.encode(data.toJson());

class Rider {
  Rider({
    this.township,
    this.availableShops,
    this.id,
    this.state,
    this.name,
    this.phoneNumber,
    this.detail,
    this.picUrl,
    this.expectedMoney,
    this.uniqueId,
  });

  List<String> township;
  List<AvailableShop> availableShops;
  String id;
  String state;
  String name;
  String phoneNumber;
  String detail;
  String picUrl;
  int expectedMoney;
  String uniqueId;

  factory Rider.fromJson(Map<String, dynamic> json) => Rider(
        township: List<String>.from(json["township"].map((x) => x)),
        availableShops: List<AvailableShop>.from(
            json["availableShops"].map((x) => AvailableShop.fromJson(x))),
        id: json["_id"],
        state: json["state"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        detail: json["detail"],
        picUrl: json["picURL"],
        expectedMoney: json["expectedMoney"],
        uniqueId: json["uniqueId"],
      );

  Map<String, dynamic> toJson() => {
        "township": List<dynamic>.from(township.map((x) => x)),
        "availableShops":
            List<dynamic>.from(availableShops.map((x) => x.toJson())),
        "_id": id,
        "state": state,
        "name": name,
        "phoneNumber": phoneNumber,
        "detail": detail,
        "picURL": picUrl,
        "expectedMoney": expectedMoney,
        "uniqueId": uniqueId,
      };
}

class AvailableShop {
  AvailableShop({
    this.name,
    this.detail,
  });

  String name;
  String detail;

  factory AvailableShop.fromJson(Map<String, dynamic> json) => AvailableShop(
        name: json["name"],
        detail: json["detail"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "detail": detail,
      };
}
