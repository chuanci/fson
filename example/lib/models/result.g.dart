// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result<T> _$ResultFromJson<T>(Map<String, dynamic> json) {
  return Result<T>(
    code: json['code'] as num,
    msg: json['msg'] as String,
    data: AConverter<T>().fromJson(json['data']),
  );
}

Map<String, dynamic> _$ResultToJson<T>(Result<T> instance) => <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': AConverter<T>().toJson(instance.data),
    };

ResultL<T> _$ResultLFromJson<T>(Map<String, dynamic> json) {
  return ResultL<T>(
    code: json['code'] as num,
    msg: json['msg'] as String,
    data:
        (json['data'] as List<dynamic>).map(AConverter<T>().fromJson).toList(),
  );
}

Map<String, dynamic> _$ResultLToJson<T>(ResultL<T> instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data.map(AConverter<T>().toJson).toList(),
    };
