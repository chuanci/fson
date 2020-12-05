import 'package:fson/src/models/index.dart';
import 'base.dart';
import 'package:wings_extensions/wings_extensions.dart';

class TypePlugin extends BasePlugin {
  @override
  bool build(JsonModel jsonModel, String key, Object value) {
    if (value is String) {
      if (value.startsWith(r"$[]")) {
        // 特殊列表类型
        String type = value.substring(3);
        type = isBuiltInType(type) ? type : type.toCapitalize();
        jsonModel.fields.add(Field(type: "List<$type>", name: key));
      } else if (value.startsWith(r"$")) {
        // 特殊类型
        String type = value.substring(1);
        type = isBuiltInType(type) ? type : type.toCapitalize();
        jsonModel.fields.add(Field(type: "$type", name: key));
      } else if (value == "@data") {
        jsonModel.dataName = key;
      } else if (value.startsWith("@")) {
        // 注解类型
        jsonModel.rawFields.add(RawField(raw: value, name: key));
      } else {
        jsonModel.fields.add(Field(type: "String", name: key));
      }
    } else if (value is bool) {
      jsonModel.fields.add(Field(type: "bool", name: key));
    } else if (value is num) {
      jsonModel.fields.add(Field(type: "num", name: key));
    } else if (value is Map) {
      jsonModel.fields.add(Field(type: "Map<String,dynamic>", name: key));
    } else if (value is List) {
      jsonModel.fields.add(Field(type: "List", name: key));
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
