import 'package:wings_extensions/wings_extensions.dart';

class Field {
  String type;
  String name;
  String? jkName;
  bool required;

  bool get hasJsonKey => jkName != null;

  Field({
    required this.type,
    required this.name,
    this.jkName,
    this.required = true,
  }) {
    if (jkName == null) {
      jkName = name.toLittleHump;
    }
  }

  toJson() => {"type": type, "name": name, "jkName": jkName, "hasJsonKey": hasJsonKey, "required": required};
}
