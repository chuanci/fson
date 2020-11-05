import 'package:json_annotation/json_annotation.dart';
import 'index.dart';

part 'task.g.dart';
    
@JsonSerializable()
class Task {
  Task({
    this.name, 
    this.msg, 
  });

  String name;
  String msg;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
  