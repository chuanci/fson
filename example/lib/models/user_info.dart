import 'package:json_annotation/json_annotation.dart';
import 'index.dart';

part 'user_info.g.dart';
    
@JsonSerializable()
class UserInfo {
  UserInfo({
    this.name, 
  });

  @JsonKey() String name;

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
  