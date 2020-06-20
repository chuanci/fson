import 'index.dart';

class Resp<T> {
  Resp();

  num code;
  String msg;
  T data;

  factory Resp.fromJson(Map<String, dynamic> json) {
    return Resp<T>()
      ..code = json['code'] as num
      ..msg = json['msg'] as String
      ..data = json['data'] as T;
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'code': code,
      'msg': msg,
      'data': data,
    };
  }
}

class RespL<T> {
  RespL();

  num code;
  String msg;
  List<T> data;

  factory RespL.fromJson(Map<String, dynamic> json) {
    return RespL<T>()
      ..code = json['code'] as num
      ..msg = json['msg'] as String
      ..data = (<T>[]..addAll(json['data'].map((d) => fromJson<T>(d))));
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'code': code,
      'msg': msg,
      'data': data,
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
