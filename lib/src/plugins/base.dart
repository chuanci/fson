import 'package:fson/src/models/index.dart';

abstract class BasePlugin {
  bool build(Json mJson, String key, Object value);
}
