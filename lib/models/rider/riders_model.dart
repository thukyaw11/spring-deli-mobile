import 'package:json_annotation/json_annotation.dart';

part 'riders_model.g.dart';

@JsonSerializable()
class RidersModel {
  List<RiderModel> data;

  RidersModel({required this.data});

  factory RidersModel.fromJson(Map<String, dynamic> jsonData) =>
      _$RidersModelFromJson(jsonData);

  Map<String, dynamic> toJson() => _$RidersModelToJson(this);
}

@JsonSerializable()
class RiderModel {
  List<String> township;
  List<AvailableShopsModel> availableShops;
  @JsonKey(name: "_id")
  String id;
  String state;
  String name;
  String phoneNumber;
  String detail;
  String picUrl;
  double expectedMoney;
  String uniqueId;

  RiderModel(
      {required this.township,
      required this.availableShops,
      required this.id,
      required this.state,
      required this.name,
      required this.phoneNumber,
      required this.detail,
      required this.picUrl,
      required this.expectedMoney,
      required this.uniqueId});

  factory RiderModel.fromJson(Map<String, dynamic> jsonData) =>
      _$RiderModelFromJson(jsonData);

  Map<String, dynamic> toJson() => _$RiderModelToJson(this);
}

@JsonSerializable()
class AvailableShopsModel {
  String name;
  String detail;

  AvailableShopsModel({required this.name, required this.detail});

  factory AvailableShopsModel.fromJson(Map<String, dynamic> jsonData) =>
      _$AvailableShopsModelFromJson(jsonData);

  Map<String, dynamic> toJson() => _$AvailableShopsModelToJson(this);
}
