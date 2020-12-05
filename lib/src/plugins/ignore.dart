import 'package:fson/src/models/index.dart';
import 'base.dart';

class IgnorePlugin extends BasePlugin {
  @override
  bool build(JsonModel jsonModel, String key, Object value) {
    return key.startsWith("_");
  }
}
