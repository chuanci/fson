import 'index.dart';
import 'package:json_annotation/json_annotation.dart';

class Converter<T> implements JsonConverter<T, Object> {
  const Converter();

  @override
  T fromJson(Object json) {
    switch (T) {
      case Task:
        return Task.fromJson(json) as T;
      case Test:
        return Test.fromJson(json) as T;
      case Response:
        return Response.fromJson(json) as T;
      default:
        return json as T;
    }
  }

  @override
  Object toJson(T object) {
    return object;
  }
}
  