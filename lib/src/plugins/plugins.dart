import 'package:fson/src/models/index.dart';

import 'base.dart';
import 'ignore.dart';
import 'imports.dart';
import 'type.dart';

// json plugins
class JsonPlugins {
  static JsonPlugins? _instance;

  JsonPlugins._internal();

  factory JsonPlugins.getInstance() => _getInstance();

  static _getInstance() {
    if (_instance == null) {
      _instance = JsonPlugins._internal();
    }
    return _instance;
  }

  List<BasePlugin> _plugins = [
    IgnorePlugin(),
    ImportsPlugin(),
    TypePlugin(),
  ];

  void build(Map<String, dynamic> jsonMap, JsonModel jsonModel) {
    jsonMap.forEach((key, value) {
      _pluginBuild(jsonModel, key, value);
    });
  }

  void _pluginBuild(JsonModel jsonModel, String key, Object value) {
    for (BasePlugin plugin in _plugins) {
      if (plugin.build(jsonModel, key, value)) {
        return;
      }
    }
  }
}
