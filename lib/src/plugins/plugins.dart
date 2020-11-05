import 'package:fson/src/models/index.dart';
import 'package:fson/src/plugins/Ignore.dart';
import 'package:fson/src/plugins/base.dart';
import 'package:fson/src/plugins/imports.dart';
import 'package:fson/src/plugins/type.dart';

// json plugins
class JsonPlugins {
  static JsonPlugins _instance;

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
    // 获取type ， 放在最后。
    TypePlugin(),
  ];

  void build(Map<String, Object> jsonMap, Json mJson) {
    jsonMap.forEach((key, value) {
      _pluginBuild(mJson, key, value);
    });
  }

  void _pluginBuild(Json mJson, String key, Object value) {
    for (BasePlugin plugin in _plugins) {
      if (plugin.build(mJson, key, value)) {
        return;
      }
    }
  }
}
