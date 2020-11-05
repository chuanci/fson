import 'package:fson/src/models/field.dart';
import 'package:fson/src/models/index.dart';

class Json {
  // .json 文件path
  String srcPath;

  // .dart 文件path
  String distPath;

  String export;

  // 字段
  List<Field> fields;

  // imports
  Set<String> imports;

  // 文件名 【test】.dart
  String fileName;

  // 类名
  String className;

  // data字段名
  // dataName != null 则为response json
  String dataName;

  // tag
  String tag;

  List<RawField> rawFields;

  bool get isResponse => dataName != null;

  Json({this.srcPath, this.distPath, this.export, this.fields, this.imports, this.fileName, this.className, this.dataName, this.tag, this.rawFields}) {
    fields ??= [];
    imports ??= Set<String>();
    rawFields ??= [];
  }

  toJson() => {
        "srcPath": srcPath,
        "distPath": distPath,
        "export": export,
        "fields": fields,
        "imports": imports.toList(),
        "fileName": fileName,
        "className": className,
        "dataName": dataName,
        "tag": tag,
        "rawFields": rawFields,
      };
}
