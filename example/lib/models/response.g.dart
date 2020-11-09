// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response<T> _$ResponseFromJson<T>(Map<String, dynamic> json) {
  return Response<T>(
    code: json['code'] as num,
    msg: json['msg'] as String,
    data: Converter<T>().fromJson(json['data']),
  );
}

Map<String, dynamic> _$ResponseToJson<T>(Response<T> instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': Converter<T>().toJson(instance.data),
    };

ResponseL<T> _$ResponseLFromJson<T>(Map<String, dynamic> json) {
  return ResponseL<T>(
    code: json['code'] as num,
    msg: json['msg'] as String,
    data: (json['data'] as List)?.map(Converter<T>().fromJson)?.toList(),
  );
}

Map<String, dynamic> _$ResponseLToJson<T>(ResponseL<T> instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data?.map(Converter<T>().toJson)?.toList(),
    };
