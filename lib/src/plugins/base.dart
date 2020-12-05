import 'package:fson/src/models/index.dart';

abstract class BasePlugin {
  bool build(JsonModel jsonModel, String key, Object value);
}
