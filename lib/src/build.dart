import 'dart:convert';
import 'dart:io';
import 'package:fson/src/models/index.dart';
import 'package:fson/src/plugins/index.dart';
import 'package:fson/src/templates/index.dart';
import 'package:path/path.dart' as path;
import 'package:wings_extensions/index.dart';

class FlutterJsonBuilder {
  String srcDir;
  String distDir;
  String tag;
  List<FileSystemEntity> fileList;
  String indexFile = "";
  var jsonList = [];

  FlutterJsonBuilder(this.srcDir, this.distDir, this.tag) {
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

  Json buildJson(File file) {
    // json文件不存在 ，返回 null
    if (!FileSystemEntity.isFileSync(file.path)) return null;
    List<String> paths = path.basename(file.path).split(".");
    String name = paths.first;
    // 文件不为 .json 格式 ， 返回 null
    // 文件名以 _ 开头 ，返回 null
    if (paths.last.toLowerCase() != "json" || name.startsWith("_")) return null;
    Json mJson = Json(
      srcPath: file.path,
      distPath: file.path
          .replaceFirst(srcDir, distDir)
          .replaceFirst(".json", ".dart"),
      export: file.path
          .replaceFirst(srcDir + path.separator, "")
          .replaceFirst(".json", ".dart"),
      fileName: name,
      className: name.toBigHump(),
      tag: tag,
    );
    Map<String, dynamic> jsonMap = json.decode(file.readAsStringSync());
    JsonPlugins.getInstance().build(jsonMap, mJson);
    return mJson;
  }

  bool build() {
    if (fileList.isEmpty) return false;
    List<Json> jsons = fileList
        .map((file) => buildJson(file))
        .cast<Json>()
        .where((element) => element != null)
        .toList();

    // index.dart
    File(path.join(distDir, 'index.dart'))
      ..createSync(recursive: true)
      ..writeAsStringSync(IndexTemplate(jsons: jsons).toString());

    // converter.dart
    File(path.join(distDir, 'converter.dart'))
      ..createSync(recursive: true)
      ..writeAsStringSync(ConverterTemplate(jsons: jsons).toString());

    jsons.forEach((element) {
      if (element == null) {
        return;
      }
      File(element.distPath)
        ..createSync(recursive: true)
        ..writeAsStringSync((element.isResponse
                ? DataTemplate(mJson: element)
                : NormalTemplate(mJson: element))
            .toString());
    });

    return true;
  }
}
