/// string utils
class StringUtils {
  StringUtils._();

  /// 首字母大写
  ///
  /// [str] 原字符串 test
  /// [return] 转换后字符串 Test
  static String toCapitalize(String str) {
    if (str.length < 2) return str.toUpperCase();
    return str[0].toUpperCase() + str.substring(1);
  }

  /// 首字母小写
  ///
  /// [str] 原字符串 Test
  /// [return] 转换后字符串 test
  static String toLowerCamelCase(String str) {
    if (str.length < 2) return str.toLowerCase();
    return str[0].toLowerCase() + str.substring(1);
  }

  /// 字符串转换为kabab型式
  /// - 以'-'连接
  ///
  /// [str] 原字符串 TestT
  /// [return] 转换后字符串 test-t
  static String toKababCase(String str) {
    return str.replaceAllMapped(RegExp('(.+?)([A-Z])'),
        (match) => '${match.group(1)}-${match.group(2)}'.toLowerCase());
  }

  /// 字符串转换为snake型式
  /// - 以'_'连接
  ///
  /// [str] 原字符串 TestT
  /// [return] 转换后字符串 test_t
  static String toSnakeCase(String str) {
    return str
        .replaceAllMapped(RegExp('(.+?)([A-Z])'),
            (match) => '${match.group(1)}_${match.group(2)}')
        .toLowerCase();
  }

  /// 字符串转换为驼峰型式
  ///
  /// [str] 原字符串 test_t
  /// [return] 转换后字符串 TestT
  static String toHump(String str) {
    return str
        .toLowerCase()
        .split("_")
        .map((e) => StringUtils.toCapitalize(e))
        .join();
  }
}
