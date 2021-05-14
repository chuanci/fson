import 'package:example/models/index.dart';

main() {
  var result = Result<UserInfo>.fromJson({
    "code": 200,
    "msg": "success",
    // "data": null,
    "data": {
      "_name": "q",
      "my_age": 1,
    }
  });

  print(result.toJson());

  var re2 = ResultL<UserInfo?>.fromJson({
    "code": 200,
    "msg": "success",
    // "data": null,
    "data": [
      {
        "_name": "q",
        "my_age": 1,
      }
    ],
  });

  print(re2.toJson());
}
