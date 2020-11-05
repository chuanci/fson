import 'package:fson/src/models/json.dart';
import 'package:fson/src/plugins/base.dart';

class ImportsPlugin extends BasePlugin {
  @override
  bool build(Json mJson, String key, Object value) {
    mJson.imports.add("index.dart");
    if (key.startsWith("@import")) {
      mJson.imports.add(value);
      return true;
    }
    return false;
  }
}
