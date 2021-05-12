import 'dart:io';

import 'package:args/args.dart';
import 'package:fson/fson.dart';
import 'package:process_run/shell.dart';

void main(List<String> args) async {
  String src = "";
  String dist = "";
  var parser = new ArgParser();
  parser
    ..addOption('src',
        abbr: 's',
        defaultsTo: './jsons',
        callback: (v) => src = v!,
        help: "Specify the json directory.")
    ..addOption('dist',
        abbr: 'd',
        defaultsTo: 'lib/models',
        callback: (v) => dist = v!,
        help: "Specify the dist directory.")
    ..addFlag('help', abbr: 'h', negatable: false, help: "help");
  parser.parse(args);
  ArgResults argResults = parser.parse(args);
  if (argResults['help']) {
    print(parser.usage);
    return;
  }

  renameFile('build.yaml', 'build.yaml.bak');

  try {
    if (FlutterJsonBuilder(src, dist).build()) {
      await Shell().run(
          "flutter packages pub run build_runner build --delete-conflicting-outputs");
    }
  } catch (e) {
    print(e.toString());
  }

  renameFile('build.yaml.bak', 'build.yaml');
}

void renameFile(String p1, String p2) {
  var file = File(p1);
  if (file.existsSync()) {
    file.renameSync(p2);
  }
}
