class Field {
  // 字段类型
  String type;

  // 字段名
  String name;

  Field({this.type, this.name});

  toJson() => {"type": type, "name": name};
}
