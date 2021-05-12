import 'package:fson/src/models/index.dart';

class JsonModel {
  // .json 文件path
  String srcPath;

  // .dart 文件path
  String distPath;

  String export;

  // 字段
  List<Field> fields = [];

  // imports
  Set<String> imports = {};

  // 文件名 【test】.dart
  String fileName;

  // 类名
  String className;

  // data字段名
  // dataName != null 则为response json
  String? dataName;

  List<RawField> rawFields = [];

  bool get isResult => dataName != null;

  bool required;

  JsonModel({
    required this.srcPath,
    required this.distPath,
    required this.export,
    required this.fileName,
    required this.className,
    this.dataName,
    this.required = true,
    List<Field>? fields,
    Set<String>? imports,
    List<RawField>? rawFields,
  }) {
    this.fields = fields ?? [];
    this.imports = imports ?? {};
    this.rawFields = rawFields ?? [];
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
        "rawFields": rawFields,
        "required": required,
      };
}
