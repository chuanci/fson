import 'package:fson/src/models/json.dart';
import 'package:fson/src/plugins/base.dart';

class IgnorePlugin extends BasePlugin {
  @override
  bool build(Json mJson, String key, Object value) {
    return key.startsWith("_");
  }
}
