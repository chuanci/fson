import 'package:fson/src/models/index.dart';

import 'base.dart';

class ImportsPlugin extends BasePlugin {
  @override
  bool build(JsonModel jsonModel, String key, Object value) {
    jsonModel.imports
        .add("${"../" * (jsonModel.export.split('/').length - 1)}index.dart");
    if (key.startsWith("@import")) {
      jsonModel.imports.add(value.toString());
      return true;
    }
    return false;
  }
}
