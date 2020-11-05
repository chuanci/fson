import 'package:json_annotation/json_annotation.dart';
import 'index.dart';

part 'response.g.dart';

@JsonSerializable()
class Response<T> {
  Response({
    this.code, 
    this.msg, 
  });
    
  num code;
  String msg;

  @Converter()
  T data;

  factory Response.fromJson(Map<String, dynamic> json) => _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}

@JsonSerializable()
class ResponseL<T> {
  ResponseL({
    this.code, 
    this.msg, 
  });
  
  num code;
  String msg;

  @Converter()
  List<T> data;

  factory ResponseL.fromJson(Map<String, dynamic> json) => _$ResponseLFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseLToJson(this);
}
  