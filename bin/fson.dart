import 'package:args/args.dart';
import 'package:fson/index.dart';
import 'package:process_run/shell.dart';

void main(List<String> args) {
  String src;
  String dist;
  String tag;
  var parser = new ArgParser();
  parser
    ..addOption('src',
        abbr: 's',
        defaultsTo: './jsons',
        callback: (v) => src = v,
        help: "Specify the json directory.")
    ..addOption('dist',
        abbr: 'd',
        defaultsTo: 'lib/models',
        callback: (v) => dist = v,
        help: "Specify the dist directory.")
    ..addOption('tag',
        abbr: 't',
        defaultsTo: '\$',
        callback: (v) => tag = v,
        help: "Specify the tag ")
    ..addFlag('help', abbr: 'h', negatable: false, help: "help");
  parser.parse(args);
  ArgResults argResults = parser.parse(args);
  if (argResults['help']) {
    print(parser.usage);
    return;
  }
  if (FlutterJsonBuilder(src, dist, tag).build()) {
    Shell().run(
        "flutter packages pub run build_runner build --delete-conflicting-outputs");
  }
}
