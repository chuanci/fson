import 'dart:convert';

import 'package:fson/src/models/index.dart';
import 'package:mustache_template/mustache.dart';

/// converter template
class ConverterTemplate {
  List<JsonModel> jsonModels;

  ConverterTemplate(this.jsonModels);

  Map get templateData => json.decode(json.encode({
        "jsonModels":
            jsonModels.where((jsonModel) => !jsonModel.isResult).toList(),
      }));

  String tpl = r"""
import 'index.dart';
import 'package:json_annotation/json_annotation.dart';

class Converter<T> implements JsonConverter<T, Object> {
  const Converter();

  @override
  T fromJson(Object json) {
    switch (T) {
{{ #jsonModels }}
      case {{ className }}:
        return {{ className }}.fromJson(json) as T;
{{ /jsonModels }}
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
