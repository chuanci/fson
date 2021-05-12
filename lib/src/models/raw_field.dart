class RawField {
  String raw;
  String name;
  bool required;

  RawField({
    required this.raw,
    required this.name,
    this.required = true,
  });

  toJson() => {"raw": raw, "name": name, "required": required};
}
