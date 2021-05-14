import 'index.dart';
import 'package:json_annotation/json_annotation.dart';

class ResultConverter<T> implements JsonConverter<T, dynamic> {
  const ResultConverter();

  @override
  T fromJson(dynamic json) {
    if (json == null) {
      return json;
    }

    switch (T.toString()) {
      case 'UserInfo':
      case 'UserInfo?':
        return UserInfo.fromJson(json) as T;
      case 'Test1':
      case 'Test1?':
        return Test1.fromJson(json) as T;
      case 'Test':
      case 'Test?':
        return Test.fromJson(json) as T;
      default:
        return json as T;
    }
  }

  @override
  dynamic toJson(T object) {
    if (object == null) {
      return object;
    }
    switch (T.toString()) {
      case 'UserInfo':
      case 'UserInfo?':
        return (object as UserInfo).toJson();
      case 'Test1':
      case 'Test1?':
        return (object as Test1).toJson();
      case 'Test':
      case 'Test?':
        return (object as Test).toJson();
      default:
        return object;
    }
  }
}
