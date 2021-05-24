// To parse this JSON data, do
//
//     final rider = riderFromJson(jsonString);

import 'dart:convert';

List<Rider> riderFromJson(String str) =>
    List<Rider>.from(json.decode(str).map((x) => Rider.fromJson(x)));

String riderToJson(List<Rider> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
    this.v,
  });

  List<String> township;
  List<AvailableShop> availableShops;
  String id;
  State state;
  String name;
  String phoneNumber;
  String detail;
  String picUrl;
  double expectedMoney;
  String uniqueId;
  int v;

  factory Rider.fromJson(Map<String, dynamic> json) => Rider(
        township: List<String>.from(json["township"].map((x) => x)),
        availableShops: List<AvailableShop>.from(
            json["availableShops"].map((x) => AvailableShop.fromJson(x))),
        id: json["_id"],
        state: stateValues.map[json["state"]],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        detail: json["detail"],
        picUrl: json["picURL"],
        expectedMoney: json["expectedMoney"].toDouble(),
        uniqueId: json["uniqueId"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "township": List<dynamic>.from(township.map((x) => x)),
        "availableShops":
            List<dynamic>.from(availableShops.map((x) => x.toJson())),
        "_id": id,
        "state": stateValues.reverse[state],
        "name": name,
        "phoneNumber": phoneNumber,
        "detail": detail,
        "picURL": picUrl,
        "expectedMoney": expectedMoney,
        "uniqueId": uniqueId,
        "__v": v,
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

enum State { YANGON, MANDALAY }

final stateValues =
    EnumValues({"Mandalay": State.MANDALAY, "Yangon": State.YANGON});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
