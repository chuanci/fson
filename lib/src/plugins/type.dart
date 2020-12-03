import 'package:fson/src/models/index.dart';
import 'package:fson/src/plugins/base.dart';
import 'package:wings_extensions/wings_extensions.dart';

class TypePlugin extends BasePlugin {
  @override
  bool build(Json mJson, String key, Object value) {
    if (value is String) {
      if (value.startsWith("${mJson.tag}[]")) {
        // 特殊列表类型
        String type = value.substring(3);
        type = isBuiltInType(type) ? type : type.toCapitalize();
        mJson.fields.add(Field(type: "List<$type>", name: key));
      } else if (value.startsWith("${mJson.tag}")) {
        // 特殊类型
        String type = value.substring(1);
        type = isBuiltInType(type) ? type : type.toCapitalize();
        mJson.fields.add(Field(type: "$type", name: key));
      } else if (value == "@data") {
        mJson.dataName = key;
      } else if (value.startsWith("@")) {
        // 注解类型
        mJson.rawFields.add(RawField(raw: value, name: key));
      } else {
        mJson.fields.add(Field(type: "String", name: key));
      }
    } else if (value is bool) {
      mJson.fields.add(Field(type: "bool", name: key));
    } else if (value is num) {
      mJson.fields.add(Field(type: "num", name: key));
    } else if (value is Map) {
      mJson.fields.add(Field(type: "Map<String,dynamic>", name: key));
    } else if (value is List) {
      mJson.fields.add(Field(type: "List", name: key));
    } else {
      return false;
    }
    return true;
  }

  bool isBuiltInType(String type) {
    return ['int', 'num', 'String', 'double', 'map', 'list', 'bool']
        .contains(type);
  }
}
