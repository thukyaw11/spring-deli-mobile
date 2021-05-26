// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RidersModel _$RidersModelFromJson(Map<String, dynamic> json) {
  return RidersModel(
    data: (json['data'] as List<dynamic>)
        .map((e) => RiderModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$RidersModelToJson(RidersModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

RiderModel _$RiderModelFromJson(Map<String, dynamic> json) {
  return RiderModel(
    township:
        (json['township'] as List<dynamic>).map((e) => e as String).toList(),
    availableShops: (json['availableShops'] as List<dynamic>)
        .map((e) => AvailableShopsModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    id: json['_id'] as String,
    state: json['state'] as String,
    name: json['name'] as String,
    phoneNumber: json['phoneNumber'] as String,
    detail: json['detail'] as String,
    picUrl: json['picUrl'] as String,
    expectedMoney: (json['expectedMoney'] as num).toDouble(),
    uniqueId: json['uniqueId'] as String,
  );
}

Map<String, dynamic> _$RiderModelToJson(RiderModel instance) =>
    <String, dynamic>{
      'township': instance.township,
      'availableShops': instance.availableShops,
      '_id': instance.id,
      'state': instance.state,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'detail': instance.detail,
      'picUrl': instance.picUrl,
      'expectedMoney': instance.expectedMoney,
      'uniqueId': instance.uniqueId,
    };

AvailableShopsModel _$AvailableShopsModelFromJson(Map<String, dynamic> json) {
  return AvailableShopsModel(
    name: json['name'] as String,
    detail: json['detail'] as String,
  );
}

Map<String, dynamic> _$AvailableShopsModelToJson(
        AvailableShopsModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'detail': instance.detail,
    };
