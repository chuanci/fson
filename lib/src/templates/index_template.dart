import 'dart:convert';

import 'package:fson/src/models/index.dart';
import 'package:mustache_template/mustache.dart';

class IndexTemplate {
  List<JsonModel> jsonModels;

  IndexTemplate(this.jsonModels);

  Map get templateData => json.decode(json.encode({
        "jsonModels": jsonModels,
      }));

  String tpl = """
export 'a.converter.dart';
{{ #jsonModels }}
export '{{ export }}';
{{ /jsonModels }}
""";

  @override
  String toString() {
    return Template(tpl, htmlEscapeValues: false).renderString(templateData);
  }
}
