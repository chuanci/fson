import 'dart:convert';

import 'package:fson/src/models/index.dart';
import 'package:mustache_template/mustache.dart';

/// result 模版
class ResultTemplate {
  JsonModel jsonModel;

  ResultTemplate(this.jsonModel);

  Map get templateData => json.decode(json.encode(jsonModel));

  String tpl = r"""
import 'package:json_annotation/json_annotation.dart';
{{ #imports }}
import '{{ . }}';
{{ /imports }}

part '{{ fileName }}.g.dart';

@JsonSerializable()
class {{ className }}<T> {
  {{ className }}({
{{ #fields }}
{{ #hasJsonKey }}
    this.{{ jkName }}, 
{{ /hasJsonKey }}
{{ ^hasJsonKey }}
    this.{{ name }}, 
{{ /hasJsonKey }}
{{ /fields }}
{{ #rawFields }}
    this.{{ name }}, 
{{ /rawFields }}
    this.{{ dataName }}, 
  });


{{ #fields }}
{{ #hasJsonKey }}
  @JsonKey(name: '{{ name }}')
  {{ type }} {{ jkName }};
{{ /hasJsonKey }}
{{ ^hasJsonKey }}
  {{ type }} {{ name }};
{{ /hasJsonKey }}
{{ /fields }}
{{ #rawFields }}
  {{ raw }} 
{{ /rawFields }}

  @Converter()
  T {{ dataName }};

  factory {{ className }}.fromJson(Map<String, dynamic> json) => _${{ className }}FromJson(json);

  Map<String, dynamic> toJson() => _${{ className }}ToJson(this);
}

@JsonSerializable()
class {{ className }}L<T> {
  {{ className }}L({
{{ #fields }}
    this.{{ name }}, 
{{ /fields }}
{{ #rawFields }}
    this.{{ name }}, 
{{ /rawFields }}
    this.{{ dataName }}, 
  });
  
{{ #fields }}
  {{ type }} {{ name }};
{{ /fields }}
{{ #rawFields }}
  {{ raw }} {{ name }};
{{ /rawFields }}

  @Converter()
  List<T> {{ dataName }};

  factory {{ className }}L.fromJson(Map<String, dynamic> json) => _${{ className }}LFromJson(json);

  Map<String, dynamic> toJson() => _${{ className }}LToJson(this);
}
  """;

  @override
  String toString() {
    return Template(tpl, htmlEscapeValues: false).renderString(templateData);
  }
}
