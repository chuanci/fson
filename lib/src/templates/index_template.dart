import 'dart:convert';

import 'package:fson/src/models/index.dart';
import 'package:mustache_template/mustache.dart';

class IndexTemplate {
  List<Json> jsons;

  IndexTemplate({this.jsons});

  Map get templateData => json.decode(json.encode({
        "jsons": jsons,
      }));

  String tpl = """
export 'converter.dart';
{{ #jsons }}
export '{{ export }}';
{{ /jsons }}
  """;

  @override
  String toString() {
    return Template(tpl, htmlEscapeValues: false).renderString(templateData);
  }
}
