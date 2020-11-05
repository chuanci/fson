class RawField {
  String raw;

  // 字段名
  String name;

  RawField({this.raw, this.name});

  toJson() => {"raw": raw, "name": name};
}
