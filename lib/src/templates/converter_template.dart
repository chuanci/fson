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

class ResultConverter<T> implements JsonConverter<T, dynamic> {
  const ResultConverter();

  @override
  T fromJson(dynamic json) {
    if (json == null) {
      return json;
    }
    
    switch (T.toString()) {
{{ #jsonModels }}
      case '{{ className }}':
      case '{{ className }}?':
        return {{ className }}.fromJson(json) as T;
{{ /jsonModels }}
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
{{ #jsonModels }}
      case '{{ className }}':
      case '{{ className }}?':
        return (object as {{ className }}).toJson();
{{ /jsonModels }}
      default:
        return object;
    }
  }
}
""";

  @override
  String toString() {
    return Template(tpl, htmlEscapeValues: false).renderString(templateData);
  }
}
