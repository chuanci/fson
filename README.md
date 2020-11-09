# fson [![Pub](https://img.shields.io/pub/v/fson.svg?style=flat-square)](https://pub.dartlang.org/packages/fson)

只用一行命令，直接将Json文件转为Dart model类。

# 安装

`flutter pub global activate fson` 或者 `pub global activate fson`

```yaml
dev_dependencies:
  build_runner: any
  json_serializable: any
```

# 使用

1. 在工程根目录下创建一个名为 "jsons" 的目录;
2. 创建或拷贝Json文件到"jsons" 目录中 ;
3. 运行 `fson` 命令生成Dart model类，生成的文件默认在"lib/models"目录下


## 特殊 Key

### "_"开头

以 _ 开头的 Key 将被 fson 过滤

### @import

> 在生成的Dart类中导入指定的文件

```
{
  "@import": "test/index.dart",
  "name": "fson"
}

// ------------------------------------------------------------

import 'package:json_annotation/json_annotation.dart';
import 'index.dart';
import 'test/index.dart';

part 'test.g.dart';

@JsonSerializable()
class Test {
  Test({
    this.name,
  });

  String name;

  factory Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);

  Map<String, dynamic> toJson() => _$TestToJson(this);
}
```

### @data
通用结构

```
{
  "@data": "data",
  "name": "fson"
}

// ------------------------------------------------------------

import 'package:json_annotation/json_annotation.dart';
import 'index.dart';

part 'test.g.dart';

@JsonSerializable()
class Test<T> {
  Test({
    this.name,
    this.data,
  });

  String name;

  @Converter()
  T data;

  factory Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);

  Map<String, dynamic> toJson() => _$TestToJson(this);
}

@JsonSerializable()
class TestL<T> {
  TestL({
    this.name,
    this.data,
  });

  String name;

  @Converter()
  List<T> data;

  factory TestL.fromJson(Map<String, dynamic> json) => _$TestLFromJson(json);

  Map<String, dynamic> toJson() => _$TestLToJson(this);
}

```

## 特殊 Value

### "$" 开头
$ 为 tag 值 ，可修改。

```
{
  "age": "$int",
  "name": "fson"
}

// ------------------------------------------------------------

import 'package:json_annotation/json_annotation.dart';
import 'index.dart';

part 'test.g.dart';

@JsonSerializable()
class Test {
  Test({
    this.age,
    this.name,
  });

  int age;
  String name;

  factory Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);

  Map<String, dynamic> toJson() => _$TestToJson(this);
}
```

### "$[]" 开头
$ 为 tag 值 ，可修改。( -t, --tag     Specify the tag )

```
{
  "age": "$[]int",
  "name": "fson"
}

// ------------------------------------------------------------

import 'package:json_annotation/json_annotation.dart';
import 'index.dart';

part 'test.g.dart';

@JsonSerializable()
class Test {
  Test({
    this.age,
    this.name,
  });

  List<int> age;
  String name;

  factory Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);

  Map<String, dynamic> toJson() => _$TestToJson(this);
}

```

### 以 "@" 开头

您也可以使用[json_annotation](https://pub.dev/packages/json_annotation)包中的“@JsonKey”标注特定的字段。

```
{
  "name": "@JsonKey() String"
}

// ------------------------------------------------------------

import 'package:json_annotation/json_annotation.dart';
import 'index.dart';

part 'test.g.dart';

@JsonSerializable()
class Test {
  Test({
    this.name,
  });

  @JsonKey()
  String name;

  factory Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);

  Map<String, dynamic> toJson() => _$TestToJson(this);
}

```

#  命令参数

默认的源json文件目录为根目录下名为 "json" 的目录；可以通过 `src` 参数自定义源json文件目录，可以通过`dist` 参数来自定义输出目录,例如:

```shell
fson src=json_files  dist=data  # 输出目录为 lib/data
```

## help
```
-s, --src     Specify the json directory.
              (defaults to "./jsons")
-d, --dist    Specify the dist directory.
              (defaults to "lib/models")
-t, --tag     Specify the tag
              (defaults to "$")
-h, --help    help
```

