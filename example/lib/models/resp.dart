import 'index.dart';

class Resp<T> {
  Resp();
  
  num code;
  String msg;
  T data;
 
  factory Resp.fromJson(Map<String, dynamic> json) {
    return Resp<T>()..code = json['code'] as num..msg = json['msg'] as String..data = json['data'] as T;
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
    return RespL<T>()..code = json['code'] as num..msg = json['msg'] as String..data = json['data'].map((d) => fromJson<T>(d)).cast<T>().toList();
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
  if (T == Task) {
    return Task.fromJson(json);
  } else {
    return null;
  }
}
