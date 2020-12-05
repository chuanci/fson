import 'dart:convert';

import 'package:example/models/index.dart';
import 'package:wings_extensions/wings_extensions.dart';

main() {
  String str = """
  {
    "code":1,
    "msg":"success",
    "data":{
      "_name":"test",
      "my_age":13
    }
  }
  """;

  var result = Result<UserInfo>.fromJson(jsonDecode(str));

  print(result.toFormatJson());
}
