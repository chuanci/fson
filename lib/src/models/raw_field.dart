class RawField {
  String raw;
  String name;
  bool required;

  RawField({
    this.raw,
    this.name,
    this.required = true,
  });

  toJson() => {"raw": raw, "name": name, "required": required};
}
