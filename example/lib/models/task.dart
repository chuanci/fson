import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
    Task();

    num name;
    
    factory Task.fromJson(Map<String,dynamic> json) => _$TaskFromJson(json);
    Map<String, dynamic> toJson() => _$TaskToJson(this);
}
