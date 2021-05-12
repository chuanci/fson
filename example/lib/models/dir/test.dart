import 'package:json_annotation/json_annotation.dart';
import '../index.dart';

part 'test.g.dart';

@JsonSerializable()
class Test {
  Test({
    this.name,
  });

  @JsonKey(name: 'name')
  String? name;

  factory Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);

  Map<String, dynamic> toJson() => _$TestToJson(this);
}
