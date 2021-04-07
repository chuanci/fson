import 'package:wings_extensions/wings_extensions.dart';

class Field {
  String type;
  String name;
  String jkName;
  bool required;

  bool get hasJsonKey => jkName != null;

  Field({
    this.type,
    this.name,
    this.jkName,
    this.required = true,
  }) {
    if (jkName == null) {
      List<String> tags = ['-', '_', ' '];
      for (var tag in tags) {
        if (name.contains(tag)) {
          jkName = name.toLittleHump(pattern: tag);
          return;
        }
      }
    }
  }

  toJson() => {
        "type": type,
        "name": name,
        "jkName": jkName,
        "hasJsonKey": hasJsonKey,
        "required": required
      };
}
