import 'dart:convert';

import 'package:fson/src/models/index.dart';
import 'package:mustache_template/mustache.dart';

/// converter template
class ConverterTemplate {
  List<Json> jsons;

  ConverterTemplate({this.jsons});

  Map get templateData => json.decode(json.encode({
        "jsons": jsons,
      }));

  String tpl = r"""
import 'index.dart';
import 'package:json_annotation/json_annotation.dart';

class Converter<T> implements JsonConverter<T, Object> {
  const Converter();

  @override
  T fromJson(Object json) {
    switch (T) {
{{ #jsons }}
      case {{ className }}:
        return {{ className }}.fromJson(json) as T;
{{ /jsons }}
      default:
        return json as T;
    }
  }

  @override
  Object toJson(T object) {
    return object;
  }
}
  """;

  @override
  String toString() {
    return Template(tpl, htmlEscapeValues: false).renderString(templateData);
  }
}
