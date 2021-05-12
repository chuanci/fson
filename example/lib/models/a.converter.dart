import 'index.dart';
import 'package:json_annotation/json_annotation.dart';

class AConverter<T> implements JsonConverter<T, dynamic> {
  const AConverter();

  @override
  T fromJson(dynamic json) {
    switch (T) {
      case UserInfo:
        return UserInfo.fromJson(json) as T;
      case Test1:
        return Test1.fromJson(json) as T;
      case Test:
        return Test.fromJson(json) as T;
      default:
        return json as T;
    }
  }

  @override
  dynamic toJson(T object) {
    return object;
  }
}
