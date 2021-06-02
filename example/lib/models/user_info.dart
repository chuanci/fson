import 'package:json_annotation/json_annotation.dart';
import 'index.dart';

part 'user_info.g.dart';
    
@JsonSerializable()
class UserInfo {
  UserInfo({
    required this.my_age, 
    required this.name, 
  });

  num my_age;
  @JsonKey(name:'_name') String name;

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
