import 'package:json_annotation/json_annotation.dart';
import 'index.dart';

part 'result.g.dart';

@JsonSerializable()
class Result<T> {
  Result({
    required this.code, 
    required this.msg, 
    this.data, 
  });


  num code;
  String msg;

  @ResultConverter()
  T? data;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class ResultL<T> {
  ResultL({
    required this.code, 
    required this.msg, 
    this.data, 
  });
  
  num code;
  String msg;

  @ResultConverter()
  List<T>? data;

  factory ResultL.fromJson(Map<String, dynamic> json) => _$ResultLFromJson(json);

  Map<String, dynamic> toJson() => _$ResultLToJson(this);
}
  