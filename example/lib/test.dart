// import 'dart:convert';
//
// import 'package:example/models/index.dart';
//
// extension JsonExtension on Object {
//   /// 格式化Json
//   ///
//   String toFormatJson() {
//     String deepSpace(int d) {
//       String tab = ' ' * 2;
//       return tab * d;
//     }
//
//     String returnSymbol = (StringBuffer()..writeln()).toString();
//
//     String fmtJson(Object obj, {int deep = 0, bool isObject = false, bool isReturn = false}) {
//       StringBuffer buffer = StringBuffer();
//       int nextDeep = deep + 1;
//       if (obj is Map) {
//         List list = obj.keys.toList();
//         if (!isObject) buffer.write(deepSpace(deep));
//         buffer.write("{");
//         if (list.isEmpty) {
//           buffer.write("}");
//         } else {
//           buffer
//             ..writeln()
//             ..writeAll(list.map((e) => "${deepSpace(nextDeep)}\"$e\": ${(fmtJson(obj[e], deep: nextDeep, isObject: true))}"), ",$returnSymbol")
//             ..writeln()
//             ..write(deepSpace(deep))
//             ..write("}");
//         }
//       } else if (obj is List) {
//         if (!isObject) buffer.write(deepSpace(deep));
//         buffer.write("[");
//         if (obj.isEmpty) {
//           buffer.write("]");
//         } else {
//           buffer
//             ..writeln()
//             ..writeAll(obj.map((e) => fmtJson(e, deep: nextDeep, isReturn: true)), ",$returnSymbol")
//             ..writeln()
//             ..write(deepSpace(deep))
//             ..write("]");
//         }
//       } else if (obj is String) {
//         if (isReturn) buffer.write(deepSpace(deep));
//         buffer.write(jsonEncode(obj));
//       } else if (obj is num || obj is bool) {
//         if (isReturn) buffer.write(deepSpace(deep));
//         buffer.write(obj);
//       } else {
//         if (isReturn) buffer.write(deepSpace(deep));
//         buffer.write("null");
//       }
//       return buffer.toString();
//     }
//
//     // return fmtJson(this);
//     return fmtJson(jsonDecode(jsonEncode(this)));
//   }
// }
//
// main() {
//   String str = """
//   {
//     "code":1,
//     "msg":"success",
//     "data":{
//       "_name":"test",
//       "my_age":13
//     }
//   }
//   """;
//
//   var result = Result<UserInfo>.fromJson(jsonDecode(str));
//
//   print(json.decode(json.encode(result)));
//
//   var test1 = Test1.fromJson(jsonDecode('{"enable1":false}'));
//   print(json.decode(json.encode(test1)));
// }
