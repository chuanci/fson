import 'package:json_annotation/json_annotation.dart';
import 'index.dart';

part 'result.g.dart';

@JsonSerializable()
class Result<T> {
  Result({
    this.code, 
    this.msg, 
    this.data, 
  });


  num code;
  String msg;

  @AConverter()
  T data;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class ResultL<T> {
  ResultL({
    this.code, 
    this.msg, 
    this.data, 
  });
  
  num code;
  String msg;

  @AConverter()
  List<T> data;

  factory ResultL.fromJson(Map<String, dynamic> json) => _$ResultLFromJson(json);

  Map<String, dynamic> toJson() => _$ResultLToJson(this);
}
  