import 'dart:convert';
import 'dart:io';

import 'package:fson/src/models/index.dart';
import 'package:fson/src/plugins/index.dart';
import 'package:fson/src/templates/index.dart';
import 'package:path/path.dart' as path;
import 'package:wings_extensions/wings_extensions.dart';

class FlutterJsonBuilder {
  String srcDir;
  String distDir;
  List<FileSystemEntity> fileList = [];
  String indexFile = "";
  var jsonList = [];

  FlutterJsonBuilder(this.srcDir, this.distDir) {
    if (srcDir.endsWith("/")) srcDir = srcDir.substring(0, srcDir.length - 1);
    if (distDir.endsWith("/"))
      distDir = distDir.substring(0, distDir.length - 1);

    var src = Directory(srcDir);
    fileList = src
        .listSync(recursive: true)
        .where((element) => element is File)
        .toList();

    if (!Directory(distDir).existsSync()) {
      Directory(distDir).createSync(recursive: true);
    }
  }

  JsonModel? buildJson(File file) {
    // json文件不存在 ，返回 null
    if (!FileSystemEntity.isFileSync(file.path)) return null;
    List<String> paths = path.basename(file.path).split(".");
    String name = paths.first;
    // 文件不为 .json 格式 ， 返回 null
    // 文件名以 _ 开头 ，返回 null
    if (paths.last.toLowerCase() != "json" || name.startsWith("_")) return null;
    JsonModel jsonModel = JsonModel(
      srcPath: file.path,
      distPath: file.path
          .replaceFirst(srcDir, distDir)
          .replaceFirst(".json", ".dart"),
      export: file.path
          .replaceFirst(srcDir + path.separator, "")
          .replaceFirst(".json", ".dart"),
      fileName: name,
      className: name.toBigHump,
    );
    print("========111");
    Map<String, dynamic> jsonMap = json.decode(file.readAsStringSync());
    print("========222");
    JsonPlugins.getInstance().build(jsonMap, jsonModel);
    return jsonModel;
  }

  bool build() {
    if (fileList.isEmpty) return false;
    List<JsonModel?> jsonModels = fileList
        .map((file) => buildJson(file as File))
        .cast<JsonModel?>()
        .toList();

    jsonModels.removeWhere((element) => element == null);

    List<JsonModel> jms = jsonModels.cast<JsonModel>();

    // index.dart
    File(path.join(distDir, 'index.dart'))
      ..createSync(recursive: true)
      ..writeAsStringSync(IndexTemplate(jms).toString());

    // converter.dart
    File(path.join(distDir, 'a.converter.dart'))
      ..createSync(recursive: true)
      ..writeAsStringSync(ConverterTemplate(jms).toString());

    jms.forEach((jsonModel) {
      File(jsonModel.distPath)
        ..createSync(recursive: true)
        ..writeAsStringSync((jsonModel.isResult
                ? ResultTemplate(jsonModel)
                : NormalTemplate(jsonModel))
            .toString());
    });

    return true;
  }
}
