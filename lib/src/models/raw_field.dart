class RawField {
  String raw;
  String name;
  RawField({this.raw, this.name});
  toJson() => {"raw": raw, "name": name};
}
