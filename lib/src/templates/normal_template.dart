import 'dart:convert';

import 'package:fson/src/models/index.dart';
import 'package:mustache_template/mustache.dart';

class NormalTemplate {
  JsonModel jsonModel;

  NormalTemplate(this.jsonModel);

  Map get templateData => json.decode(json.encode(jsonModel));

  String tpl = r"""
import 'package:json_annotation/json_annotation.dart';
{{ #imports }}
import '{{ . }}';
{{ /imports }}

part '{{ fileName }}.g.dart';
    
@JsonSerializable()
class {{ className }} {
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
  {{ raw }} {{ name }};
{{ /rawFields }}

  factory {{ className }}.fromJson(Map<String, dynamic> json) => _${{ className }}FromJson(json);

  Map<String, dynamic> toJson() => _${{ className }}ToJson(this);
}
""";

  @override
  String toString() {
    return Template(tpl, htmlEscapeValues: false).renderString(templateData);
  }
}
