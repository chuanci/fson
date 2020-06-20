import 'index.dart';

class Response<T> {
  Response();

  num code;
  String msg;
  T datax;

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response<T>()
      ..code = json['code'] as num
      ..msg = json['msg'] as String
      ..datax = json['datax'] as T;
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'code': code,
      'msg': msg,
      'datax': datax,
    };
  }
}

class ResponseList<T> {
  ResponseList();

  num code;
  String msg;
  List<T> datax;

  factory ResponseList.fromJson(Map<String, dynamic> json) {
    return ResponseList<T>()
      ..code = json['code'] as num
      ..msg = json['msg'] as String
      ..datax = (<T>[]..addAll(json['datax'].map((d) => fromJson<T>(d))));
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'code': code,
      'msg': msg,
      'datax': datax,
    };
  }
}

fromJson<T>(Map<String, dynamic> json) {
  if (T == User) {
    return User.fromJson(json);
  } else if (T == Card) {
    return Card.fromJson(json);
  } else if (T == Profile) {
    return Profile.fromJson(json);
  } else {
    return null;
  }
}
