## Flutter 

学习视频：[https://www.bilibili.com/video/BV1S4411E7LY/](https://www.bilibili.com/video/BV1S4411E7LY/)

## dart 语言 

资源： dart 语言 简单介绍 [https://www.foooor.com/Dart/01-Dart简介.html](https://www.foooor.com/Dart/01-Dart简介.html) 

这里只记录一些重点的。 dart 和 其他的语言没有太大的区别，只有少部分的差异。本来不想记录的，但是在学习的过程中，发现一些差异，就记录下来。

### 数据类型

1、数字类型   int 和 double ，分别表示 整数 和 浮点数。double 可以表达整型，也可以是浮点型。
2、字符串类型 可以用 单引号 或 双引号 ，**三引号** 表示。 
3、布尔类型
4、列表类型
5、map类型

容器： 列表（list） 和 映射（map） 集合（set）

### 类型转换

1、int 转 double ： int.toDouble()
2、double 转 int ： double.toInt()
3、数字转 string ： num.toString()
4、string 转数字 ： int.parse() 或 double.parse()

dynamic 转其他类型

1、dynamic 转 int ： int.parse(dyn.toString())
2、dynamic 转 double ： double.parse(dyn.toString())

```dart
dynamic v = 42;
int i = v;
print(i);
```

### 面向对象

类

构造函数： 默认构造函数，构造函数简写。  

命名构造函数：可以有多个命名构造函数。这个和C++ 一样。不能 参数据的个数据或类型进行重载，要重新给一个命名。

重定向构造函数：可以调用类的其他构造函数。

```dart

class Student {
  late String sid;
  String? name;
  late int age;

  // 默认构造方法
  Student(this.sid, this.name, this.age);

  // 定义命名构造函数，类名后的名称是自定义的
  Student.initByNameAndAge(this.name, this.age);

  // 新的构造方法
  Student.fromMap(Map<String, Object> map) {
    this.name = map['name'] as String;
    this.age = map['age'] as int;
  }

  void study() {
    print("我是${this.name}, 我${this.age}岁了, 我在学习");
  }
}

void main() {
  // 通过默认构造函数创建对象
  Student stu1 = Student("001", "Doubi", 12);
  stu1.study();

  // 通过命名构造函数创建对象
  Student stu2 = Student.initByNameAndAge("ShaBi", 13);
  stu2.sid = "002";
  stu2.study();

  // 通过命名构造函数创建对象
  Student stu3 = Student.fromMap({"name": "ErBi", "age": 14});
  stu3.study();
}
```

常量构造函数：在 构造函数前面 加 const。创建多个同样参数的对象时，会复用同一个对象。

```dart 
main(List<String> args) {
  var p1 = const Person('逗比', 12);
  var p2 = const Person('逗比', 12);
  const p3 = Person('逗比', 12);
  print(identical(p1, p2)); // 输出: true
  print(identical(p2, p3)); // 输出: true
}
```

级联操作， 可以在一个对象上 连续调用 多个方法。 

```dart

```
 私有属性和方法, 可以在属性或方法名 前 加 下划线 ，表示 私有。 只能在 类 内部 访问。

```dart
class Person {
  String name;
  int _age;

  Person(this.name, this.age);

  void _sayHello() {
    print("Hello, my name is $name");
  }
}
```
### 继承

使用extends关键字实现继承. 

复写父类方法, 写一个和父类同名同参数的方法，就可以复写父类的方法。

复写之前，调用该方法，会调用子类的方法。 如果要调用父类的方法， 可以使用 super 关键字。


类型判断 runtimeType， 判断某个对象是否是某个类型

```dart

void main() {
  Pigeon pigeon = Pigeon();
  Sparrow sparrow = Sparrow();

  print(pigeon.runtimeType); // 输出: Pigeon
  print(sparrow.runtimeType); // 输出: Sparrow

  print(pigeon.runtimeType == Pigeon); // true,鸽子对象的类型是鸽子
  print(pigeon.runtimeType == Bird); // false,鸽子对象的类型不是鸟
  print(sparrow.runtimeType == Sparrow); // true,麻雀对象的类型是麻雀
}

```

Mixins 混入，类似于 C++ 的多继承。 可以在类中 混入 其他类的方法。

用 with 关键字 混入 其他类的方法。如下：

```dart
mclass Bird {
  // 定义一个鸟类
  late int age; // 鸟都有年龄

  void fly() {
    // 定义了一个飞的方法
    print("我${this.age}岁了，我会飞");
  }
}

class Poultry {
  // 定义一个家禽类
  late int number; // 家禽需要编号

  void eat() {
    // 定义了一个吃的方法
    print("我吃饭啦");
  }
}

class Chicken extends Bird with Poultry {
  // 定义一个鸡类，继承自鸟类和家禽类

  void fly() {
    print("我不会飞");
  }
}

void main() {
  Chicken chicken = Chicken(); // 创建一个鸡对象
  chicken.age = 1;
  chicken.number = 9527;
  chicken.fly();
  chicken.eat();
}
```
可以定义专门用于混入的类，如下：

```dart
mixin Poultry {
  // 定义一个家禽类
  late int number; // 家禽需要编号

  void eat() {
    // 定义了一个吃的方法
    print("我吃饭啦");
  }
}
```
mixin 定义的类不能被实例化。 只能在 其他类 中 混入。类似于其他的语言的接口。 

### 多态

同一个类型的父类型对象，因为指向的是不同的子对象，而表现出的不同的状态.态是建立在继承的基础之上

抽象类: 含有抽象方法的类成为抽象类. 在 class 前面加上 abstract 关键字，就是定义了抽象类. 

抽象类中也可以包含非抽象方法，子类继承抽象类需要重写抽象类中所有的抽象方法。注意是所有的方法。

接口： 如果一个抽象类中的方法都是抽象方法，我们可以将这个抽象类定义成接口。

### 数据与JSON 的转换

字典转 json 

使用 jsonEncode() 函数将字典转换为 JSON 字符串。

```dart
import 'dart:convert';

void main() {
  Map<String, dynamic> data = {
    'name': '逗比',
    'age': 25,
  };

  String jsonString = jsonEncode(data);
  print(jsonString);
}
```
JSON转字典

使用 jsonDecode() 函数将 JSON 字符串转换为字典。

```dart
import 'dart:convert';

void main() {
  String jsonString = '{"name": "逗比", "age": 25}';

  Map<String, dynamic> data = jsonDecode(jsonString);
  print(data);
}
```

对象转JSON

先获取对象的字典格式的数据，所以在对象中定义了一个toJson()方法，返回字典数据，然后再通过jsonEncode()函数，将字典转换为JSON字符串. 

```dart
import 'dart:convert';

class Person {
  String name;
  int age;

  Person(this.name, this.age);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
    };
  }
}

void main() {
  Person person = Person('逗比', 25);
  String jsonString = jsonEncode(person.toJson());

  print(jsonString);
}
```

JSON转对象

一般将JSON转换为字典就可以获取到数据了，如果有特殊的需求，再将字典转换为对象。

首先将JSON字符串转换为字典，然后通过工厂构造函数通过字典构建对象。

```dart
import 'dart:convert';

class Person {
  String name;
  int age;

  Person(this.name, this.age);

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(json['name'], json['age']);
  }
}

void main() {
  String jsonString = '{"name": "逗比", "age": 25}';

  // 先将Json 转换为字典
  Map<String, dynamic> data = jsonDecode(jsonString);
  // 使用工厂构造函数将字典转换为对象
  Person person = Person.fromJson(data);

  print(person.name);
  print(person.age);
}
```

### 函数式编程

### 异常

### 异步

### 库

## flutter 

《Flutter实战·第二版》 [https://book.flutterchina.club/](https://book.flutterchina.club/)

https://docs.flutter.cn/

flutter 命令行文档 ： [https://docs.flutter.cn/reference/flutter-cli](https://docs.flutter.cn/reference/flutter-cli)

flutter sdk 下载 ： https://flutter.dev/docs/development/tools/sdk/releases

报错：

```
Error: Building with plugins requires symlink support.
Please enable Developer Mode in your system settings. Run
start ms-settings:developers
to open settings.
```

打开开发者模式，在

![[flutter-20250304144752836.png]]


``` sh
>flutter run -d windows
Launching lib\main.dart on Windows in debug mode...
Building Windows application...                                     73ms
Error: Unable to generate build files

```

要在管理员的权限下 运行。 


启动时加参数，让 Flutter 显示调试 URL：

flutter run --verbose


###  flutter 版本管理工具 


https://github.com/leoafarias/fvm






