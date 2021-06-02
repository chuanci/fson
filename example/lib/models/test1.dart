import 'package:json_annotation/json_annotation.dart';
import 'index.dart';

part 'test1.g.dart';
    
@JsonSerializable()
class Test1 {
  Test1({
    this.enable, 
  });

  bool? enable;

  factory Test1.fromJson(Map<String, dynamic> json) => _$Test1FromJson(json);

  Map<String, dynamic> toJson() => _$Test1ToJson(this);
}
